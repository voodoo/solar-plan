class Priority < ApplicationRecord
  has_many :items
  def self.need
    Priority.find 1
  end
  def self.want
    Priority.find 2
  end
  def self.lux
    Priority.find 3
  end    
end
