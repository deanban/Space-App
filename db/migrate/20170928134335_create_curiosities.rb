class CreateCuriosities < ActiveRecord::Migration[5.1]
  def change
    create_table :curiosities do |t|
      t.integer :photo_id
      t.string :cam_name
      t.string :img_src
      t.datetime :earth_date

      t.timestamps
    end
  end
end
