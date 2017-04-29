class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :body
      t.string :color
      t.boolean :fuel, default: true
      t.float :volume

      t.timestamps
    end
  end
end
