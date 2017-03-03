class Fixture < ActiveRecord::Base
  serialize :comment, Hash

  # == Associations
  belongs_to :team_one, class_name: "Team", foreign_key: 'team_one_id'
  belongs_to :team_two, class_name: "Team", foreign_key: 'team_two_id'
  belongs_to :tournament_phase

  # == Validations
  validates :team_one, :team_two, :tournament_phase, :state, presence: true

  # == State machine
  state_machine :state, :initial => :pending do

    event :start do
      transition [:pending, :paused] => :in_progress
    end

    event :pause do
      transition [:in_progress] => :paused
    end

    event :resume do
      transition [:paused] => :in_progress
    end

    event :finish do
      transition [:pending, :in_progress, :paused, :finished] => :finished
    end
  end

  def winner

    if points_team_one > points_team_two
      team_one
    else
      team_two
    end
  end

  def looser

    if points_team_one < points_team_two
      team_one
    else
      team_two
    end
  end

  def time_left_format
    if time_left.present? && time_left > 0
      "#{time_left.divmod(60).first}:#{time_left.divmod(60).last.to_s.rjust(2,'0')}"
    else
      "0:00"
    end
  end

  # == creates points for standing in a group
  def set_points()

    fixture = self

    if fixture.tournament_phase.phase.can_create_fixture?

      # Win
      if fixture.points_team_one > fixture.points_team_two

        win_match_points  = fixture.points_team_one - fixture.points_team_two
        lose_match_points = fixture.points_team_two - fixture.points_team_one
        TournamentDateCategoryTeamStanding.record_win(fixture,fixture.team_one,win_match_points)
        TournamentDateCategoryTeamStanding.record_lose(fixture,fixture.team_two,lose_match_points)

        # Lost
      elsif fixture.points_team_one < fixture.points_team_two

        win_match_points  = fixture.points_team_two - fixture.points_team_one
        lose_match_points = fixture.points_team_one - fixture.points_team_two
        TournamentDateCategoryTeamStanding.record_lose(fixture,fixture.team_one,lose_match_points)
        TournamentDateCategoryTeamStanding.record_win(fixture,fixture.team_two,win_match_points)

        # Tie
      else

        TournamentDateCategoryTeamStanding.record_tie(fixture,fixture.team_one,0)
        TournamentDateCategoryTeamStanding.record_tie(fixture,fixture.team_two,0)
      end
    end

    self.tweet()
  end

  def tweet

    fixture     = Fixture.find(self.id)
    tournament  = fixture.tournament_phase.tournament

    if tournament.twitter_configuration.present? && fixture.finished? && !fixture.twitted?

      TwitterHelper.twit_fixture(tournament.id,fixture.id)
    end
  end

  def add_comment(comment)
    new_comment = {"#{ Time.now }" => "#{ comment }"}
    fixture     = Fixture.find(self.id)
    tournament  = fixture.tournament_phase.tournament
    l

    self.comment.merge!(new_comment)
    save
    TwitterHelper.twit_comment(tournament.twitter_configuration,new_comment) if tournament.twitter_configuration.present?
  end

  class << self

    # converts array into hashes so it can uses update_fixture
    def upload_fixture(fixture_array)

      matches = []
      fixture_array.each do |fixture|

        match                   = {}
        match["id"]             = fixture[0]
        match["team_one_id"]    = fixture[1]
        match["team_two_id"]    = fixture[2]
        match["phase_id"]       = fixture[3]
        match["points_team_one"]= fixture[4]
        match["points_team_two"]= fixture[5]
        match["flags_team_one"] = fixture[6]
        match["flags_team_two"] = fixture[7]
        match["time_left"]      = fixture[8]
        match["state"]          = fixture[9]

        matches << match
      end

      update_fixtures(matches)
    end

    def update_fixture(content)

      doc     = Hash.from_xml(content)
      matches = doc["data"]["fixtures"]["fixture"]
      update_fixtures(matches)
    end

    def update_fixtures(matches)

      has_updates = false
      has_updates_on_phase_id = nil

      matches.each do |match|

        # New match
        if match["id"].to_i < 0

          # Re-check for double upload of a not saved game
          #   TODO:Test it
          #
          f = Fixture.where(team_one_id: match["team_one_id"].to_i, team_two_id: match["team_two_id"].to_i, tournament_tournament_date_category_phase_id: match["phase_id"].to_i)
          if f.count == 0

            finish_it = match["state"] == "finished"
            f = Fixture.create(
                tournament_tournament_date_category_phase_id: match["phase_id"].to_i,
                active: false,
                team_one_id: match["team_one_id"].to_i,
                team_two_id: match["team_two_id"].to_i,
                points_team_one: match["points_team_one"].to_i,
                points_team_two: match["points_team_two"].to_i,
                flags_team_one:  match["flags_team_one"].to_i,
                flags_team_two:  match["flags_team_two"].to_i,
                time_left: match["time_left"].to_i,
                state: match["state"],
                twitted: false
            )
          else
            f         = f.first
            finish_it = ( match["state"] == "finished" && !f.finished? )

            f.points_team_one = match["points_team_one"].to_i
            f.points_team_two = match["points_team_two"].to_i
            f.flags_team_one  = match["flags_team_one"].to_i
            f.flags_team_two  = match["flags_team_two"].to_i
            f.time_left       = match["time_left"].to_i
            f.state           = match["state"]
            f.save

          end
        else

          f = Fixture.find(match["id"].to_i)
          finish_it = ( match["state"] == "finished" && !f.finished? )
          f.points_team_one = match["points_team_one"].to_i
          f.points_team_two = match["points_team_two"].to_i
          f.flags_team_one  = match["flags_team_one"].to_i
          f.flags_team_two  = match["flags_team_two"].to_i
          f.time_left       = match["time_left"].to_i
          f.state           = match["state"]
          f.save
        end

        match["real_id"] = f.id
        if finish_it

          f.set_points()
          has_updates = true
          has_updates_on_phase_id = f.tournament_phase.id
        end
      end

      matches
    end
  end
end
