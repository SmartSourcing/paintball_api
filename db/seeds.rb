# seed file for basic data.

# Categories
Category.create(name: 'fivemen', description: 'd4 - five men', active: true, :minutes_to => 6, :career_to => 3)
Category.create(name: 'd4', description: 'xball', active: true, :minutes_to => 12, :career_to => 12)
pro = Category.create(name: 'Pro', description: 'xball', active: true, :minutes_to => 17, :career_to => 9)

# Sponsors
pe = Sponsor.create(name: 'Planet Eclipse', web_link: '', facebook_link: '', home_sponsor: true,
                    logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/pe.jpg"), :filename => "pe.jpg") )

hk = Sponsor.create(name: 'HK Army', web_link: '', facebook_link: '', home_sponsor: true,
                    logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/hk.jpg"), :filename => "hk.jpg") )

ss = Sponsor.create(name: 'Smart Sourcing', web_link: '', facebook_link: '', home_sponsor: true,
                    logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/smart.jpg"), :filename => "smart.jpg") )

ninja = Sponsor.create(name: 'Ninja', web_link: '', facebook_link: '', home_sponsor: true,
                       logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/ninja.jpg"), :filename => "ninja.jpg") )

dye = Sponsor.create(name: 'Dye', web_link: '', facebook_link: '', home_sponsor: true,
                     logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/dye.jpg"), :filename => "dye.jpg") )

delos = Sponsor.create(name: 'Delos', web_link: '', facebook_link: '', home_sponsor: true,
                       logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/delos.jpg"), :filename => "delos.jpg") )

# Tournaments
t_nxl = Tournament.create(name: 'NXL', nickname: 'NXL', started_at: '2017-01-01', finished_at: '2017-12-31',
    tournament_type: 'speedball', country: 'US', active: true,
    logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/psp_logo.png"), :filename => "psp_logo.png") )

t_mill = Tournament.create(name: 'Millenium series', nickname: 'MLS', started_at: '2017-01-01', finished_at: '2017-12-31',
                           tournament_type: 'speedball', country: 'UK', active: true,
                           logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/millennium_logo.png"), :filename => "millennium.png") )

t_apl = Tournament.create(name: 'America Paintball League', nickname: 'APL', started_at: '2017-01-01', finished_at: '2017-12-31',
                           tournament_type: 'speedball', country: 'UK', active: true,
                           logo: ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/test/support/apl_logo.png"), :filename => "apl.png") )

# Nxl tournament dates
td_las_vegas = TournamentDate.create(description: 'Las Vegas', active: true, started_at: '2017-03-17',
    finished_at: '2017-03-19', close_draw_at: '2017-03-12', contact: 'someone@playnxl.com',
    place: 'Las Vegas, nevada, united states', tournament: t_nxl)

td_texas_open = TournamentDate.create(description: 'Texas Open', active: true, started_at: '2017-05-05',
    finished_at: '2017-05-07', close_draw_at: '2017-05-01', contact: 'someone@playnxl.com',
    place: 'Dallas, texas, united states', tournament: t_nxl)

td_atlantic_city = TournamentDate.create(description: 'Atlantic City', active: true, started_at: '2017-06-23',
    finished_at: '2017-06-25', close_draw_at: '2017-06-19', contact: 'someone@playnxl.com',
    place: 'Las Vegas, nevada, united states', tournament: t_nxl)

t_world_cup = TournamentDate.create(description: 'World Cup', active: true, started_at: '2017-09-02',
    finished_at: '2017-09-05', close_draw_at: '2017-08-29', contact: 'someone@playnxl.com',
    place: 'Orlando, florida, united states', tournament: t_nxl)

td_las_vegas.sponsors << [pe, hk, ss, ninja, dye, delos]

# Token
Token.create(name: 'api')

# Phases
gral = Phase.create(name: 'Gral', tournament: t_nxl)
Phase.create(name: 'Semis', tournament: t_nxl)
Phase.create(name: 'Final', tournament: t_nxl)
Phase.create(name: '3th', tournament: t_nxl)

# Tournament phases
t_phase = TournamentPhase.create(active: true, phase: gral, category: pro, tournament: t_nxl, tournament_dates_id: td_las_vegas.id)

# Teams
sdd = Team.create(name: 'San Diego Dinasty', country: 'US', locale: 'en', category: pro)
hh  = Team.create(name: 'Houston Heat', country: 'US', locale: 'en', category: pro)
xf  = Team.create(name: 'X Factor', country: 'US', locale: 'en', category: pro)
acd = Team.create(name: 'aC Dallas', country: 'US', locale: 'en', category: pro)
br  = Team.create(name: 'Baltimore Revo', country: 'US', locale: 'en', category: pro)
boo = Team.create(name: 'Boom', country: 'US', locale: 'en', category: pro)
edi = Team.create(name: 'Edmont Impact', country: 'US', locale: 'en', category: pro)
red = Team.create(name: 'Red Legion', country: 'US', locale: 'en', category: pro)
tbd = Team.create(name: 'Tampa Bay Damage', country: 'US', locale: 'en', category: pro)
ass = Team.create(name: 'Aftershock', country: 'US', locale: 'en', category: pro)

# Fixture
Fixture.create(team_one: sdd, team_two: hh,   tournament_phase: t_phase, points_team_one: 0, points_team_two: 0, time_left: 840, active: true, state: 'pending')
Fixture.create(team_one: xf, team_two: acd,   tournament_phase: t_phase, points_team_one: 0, points_team_two: 0, time_left: 840, active: false, state: 'pending')
Fixture.create(team_one: br, team_two: boo,   tournament_phase: t_phase, points_team_one: 0, points_team_two: 0, time_left: 840, active: false, state: 'pending')
Fixture.create(team_one: edi, team_two: red,  tournament_phase: t_phase, points_team_one: 0, points_team_two: 0, time_left: 840, active: false, state: 'pending')
Fixture.create(team_one: tbd, team_two: ass,  tournament_phase: t_phase, points_team_one: 0, points_team_two: 0, time_left: 840, active: false, state: 'pending')

# Standings
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: sdd, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: hh,  year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: xf,  year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: acd, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: br,  year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: boo, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: edi, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: red, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: tbd, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)
TournamentCategoryTeamStanding.create(tournament: td_las_vegas, category: pro, team: ass, year: 2017,wins: 0, losts: 0, ties: 0, position: 0)

