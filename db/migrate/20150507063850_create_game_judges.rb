class CreateGameJudges < ActiveRecord::Migration
  def change
    create_table :game_judges do |t|
      t.integer :game_round_id
      t.boolean :firstname
      t.boolean :lastname
      t.boolean :city
      t.boolean :country
      t.boolean :fruit
      t.boolean :car
      t.boolean :color
      t.boolean :job
      t.boolean :food
      t.boolean :thing
      t.boolean :animal
      t.boolean :flower

      t.timestamps
    end
  end
end
