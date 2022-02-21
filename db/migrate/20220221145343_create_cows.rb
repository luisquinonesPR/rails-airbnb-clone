class CreateCows < ActiveRecord::Migration[6.1]
  def change
    create_table :cows do |t|
      t.string :name
      t.text :description
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
