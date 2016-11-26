class CreateDealerships < ActiveRecord::Migration[5.0]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :inventory

      t.timestamps
    end
  end
end
