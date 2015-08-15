class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :exp
      t.string :uid
      t.integer :rating
      t.integer :active_challenge
      t.string :title

      t.timestamps
    end
  end
end
