class CreateTotemsTable < ActiveRecord::Migration
  def change
    create_table :totems do |t|
      t.integer :player_id
      t.integer :loser_id
    end
  end
end
