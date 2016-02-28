class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name, default: 'Solar Plan'
      t.string :ip
      t.string :token

      t.timestamps
    end
  end
end
