class CreateLogLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :log_locations do |t|
      t.references :survivor, index: true, foreign_key: {on_delete: :cascade}
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.datetime :created_at
      # t.timestamps
    end
  end
end
