class CreateAsteroids < ActiveRecord::Migration[5.1]
  def change
    create_table :asteroids do |t|
      t.string :name
      t.string :nasa_jpl_url
      t.float :estimated_diameter_min
      t.float :estimated_diameter_max
      t.boolean :hazardous
      t.string :close_approach_date
      t.float :relative_velocity
      t.float :miss_distance
    end
  end
end
