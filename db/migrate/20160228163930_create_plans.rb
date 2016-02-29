class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name, default: 'Solar Plan'
      t.string :ip
      t.string :token
      t.integer :insolation, default: 4
      t.integer :discharge, default: 50

      t.timestamps
    end
  end
end
