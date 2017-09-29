class CreateUserCuriosities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_curiosities do |t|
      t.integer :user_id
      t.integer :curiosity_id
    end
  end
end
