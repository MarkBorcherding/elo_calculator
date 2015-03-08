class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :club_id, null: false
      t.integer :player_id, null: false

      t.index :club_id
      t.index :player_id

      t.timestamps
    end
  end
end
