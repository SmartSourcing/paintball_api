json.id             fixture.id
json.team_one_id    fixture.team_one.id
json.team_one_name  fixture.team_one.try(:name)
json.team_two_id    fixture.team_two.id
json.team_two_name  fixture.team_two.try(:name)
json.phase          fixture.tournament_phase.try(:name)
json.time_left      fixture.time_left
json.active         fixture.active
json.comment        fixture.comment
json.state          fixture.state