class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, default: 'Appliance Name'
      t.integer :watts, default: 100
      t.integer :hours, default: 1
      t.belongs_to :plan, foreign_key: true
      t.belongs_to :priority, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
