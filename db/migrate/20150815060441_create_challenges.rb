class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :exp
      t.string :status

      t.timestamps
    end
  end
end
