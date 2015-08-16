class CreateChallengeData < ActiveRecord::Migration
  def change
    create_table :challenge_data do |t|
      t.string :name
      t.integer :difficulty

      t.timestamps
    end
  end
end
