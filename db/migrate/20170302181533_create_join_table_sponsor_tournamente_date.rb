class CreateJoinTableSponsorTournamenteDate < ActiveRecord::Migration
  def change

    #sponsors_tournament_dates
    create_join_table :sponsors, :tournament_dates do |t|

      #t.index [:sponsors_id, :tournament_date_id]
      #t.index [:tournament_date_id, :sponsors_id]
    end
  end
end
