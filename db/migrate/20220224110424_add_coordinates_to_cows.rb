class AddCoordinatesToCows < ActiveRecord::Migration[6.1]
  def change
    add_column :cows, :latitude, :float
    add_column :cows, :longitude, :float
    add_column :cows, :address, :string
  end
end
