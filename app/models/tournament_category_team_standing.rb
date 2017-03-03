class TournamentCategoryTeamStanding < ActiveRecord::Base
  # == Constants
  YEARS = [2014, 2015, 2016, 2017] #TODO: Each year news a new year, improve this.

  # == Associations
  belongs_to :tournament
  belongs_to :category
  belongs_to :team

  # Given a yearly standing for a given team, returns all the dates the team player
  def tournament_dates()
    TournamentDateCategoryTeam.where(tournament: self.tournament,
                                     category: self.category,
                                     team: self.team).where("EXTRACT(year FROM \"created_at\") = #{self.year}")
  end

  def standing

    position = ( self.position != 0 ) ? "#{self.position.ordinalize} posición." : "Sin Ranking" #TODO: I18n this !

    "#{self.team.name}: #{self.tournament.name} (#{self.tournament.country}) - #{self.year} - #{position}"
  end
end
