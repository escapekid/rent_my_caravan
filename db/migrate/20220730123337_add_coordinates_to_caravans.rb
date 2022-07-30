class AddCoordinatesToCaravans < ActiveRecord::Migration[6.1]
  def change
    add_column :caravans, :latitude, :float
    add_column :caravans, :longitude, :float
  end
end
