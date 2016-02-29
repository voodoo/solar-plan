class Plan < ApplicationRecord

  has_many :items

  include Tokenable

  after_create :add_default_items

  validates_presence_of :name

  def watt_hours
    self.items.map{|i| i.watt_hours if i.active? }.compact.sum
  end

  def add_default_items
    need = Priority.find(1)
    want = Priority.find(2)
    lux  = Priority.find(3)

    self.items.create!(name: 'Lights', watts: 20, hours: 12, priority: need)
    self.items.create!(name: 'Freezer', watts: 150, hours: 8, priority: need)    
    self.items.create!(name: 'Fan', watts: 40, hours: 16, priority: need)

    self.items.create!(name: 'TV', watts: 200, hours: 4, priority: want)
    self.items.create!(name: 'Computer', watts: 120, hours: 4, priority: want)
    self.items.create!(name: 'More Lights', watts: 40, hours: 6, priority: want)
    self.items.create!(name: 'Clothes Washer', watts: 500, hours: 1, priority: want)    
    self.items.create!(name: 'Fridge', watts: 150, hours: 8, priority: want)    
    self.items.create!(name: 'Espresso', watts: 350, hours: 1, priority: want)

    self.items.create!(name: 'AC', watts: 1500, hours: 6, priority: lux)
    self.items.create!(name: 'Clothes Dryer', watts: 1500, hours: 2, priority: lux)    
    self.items.create!(name: 'Coffee Maker', watts: 1000, hours: 3, priority: lux) 
    self.items.create!(name: 'Microwave', watts: 250, hours: 1, priority: lux)  
    self.items.create!(name: 'Pump', watts: 500, hours: 24, priority: lux)    

  end
end

