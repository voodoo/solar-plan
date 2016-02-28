class CreatePriorities < ActiveRecord::Migration[5.0]
  def change
    create_table :priorities do |t|
      t.string :name

      t.timestamps
    end

    Priority.create!(name: 'Need')
    Priority.create!(name: 'Want')
    Priority.create!(name: 'Luxury')

  end
end
