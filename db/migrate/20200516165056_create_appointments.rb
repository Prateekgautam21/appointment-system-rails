class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.date :dateOfservice
      t.time :timeOfservice
      t.float :totalbill
      t.boolean :hasServiceA
      t.boolean :hasServiceB
      t.boolean :hasServiceC

      t.timestamps
    end
  end
end
