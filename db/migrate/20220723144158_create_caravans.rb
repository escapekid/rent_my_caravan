class CreateCaravans < ActiveRecord::Migration[6.1]
  def change
    create_table :caravans do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :address
      t.boolean :availability
      t.integer :number_of_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
