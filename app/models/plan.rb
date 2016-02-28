class Plan < ApplicationRecord

  has_many :items

  include Tokenable

  after_create :add_default_items

  validates_presence_of :name

  def watt_hours
    self.items.map{|i| i.watt_hours}.sum
  end

  def add_default_items

    self.items.create!(name: 'Lights', watts: 20, hours: 12, priority: 1)
    self.items.create!(name: 'Freezer', watts: 100, hours: 8, priority: 1)    
    self.items.create!(name: 'Fan', watts: 40, hours: 12, priority: 1)

    self.items.create!(name: 'Computer', watts: 120, hours: 4, priority: 2)
    self.items.create!(name: 'More Lights', watts: 40, hours: 6, priority: 2)
    self.items.create!(name: 'Clothes Washer', watts: 500, hours: 1, priority: 2)    
    self.items.create!(name: 'Fridge', watts: 150, hours: 8, priority: 2)    
    self.items.create!(name: 'Espresso', watts: 350, hours: 1, priority: 2)

    self.items.create!(name: 'AC', watts: 500, hours: 6, priority: 3)
    self.items.create!(name: 'Clothes Dryer', watts: 1500, hours: 1, priority: 3)    
    self.items.create!(name: 'Coffee', watts: 1000, hours: 1, priority: 3)    

  end
end

