class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.integer :rating
      t.string :status
      t.challenges :has_many

      t.timestamps
    end
  end
end
