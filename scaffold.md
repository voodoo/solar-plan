r db:drop
r d scaffold item
r d scaffold plan

r g scaffold plan name ip token
r g scaffold item name watts:integer hours:integer priority:integer plan:belongs_to active:boolean


r db:migrate



======================

#layout.slim

    nav
      = link_to "Home", '/'


#plans_controller.rb

@plan = Plan.new(name: "Solar Plan #{Date.today}")

#item.rb

default_scope {order('priority ASC')} 

#plan.rb

@plan.ip = request.remote_ip


class Plan < ApplicationRecord

  default_scope order('priority ASC') 

  has_many :items

  after_create :add_default_items
  after_create :create_token

  def create_token

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

