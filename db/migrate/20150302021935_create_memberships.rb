class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :club_id
      t.integer :player_id
      t.timestamps
    end
  end
end
