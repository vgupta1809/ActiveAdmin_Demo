class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.integer :physician_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
