class Sensor < ActiveRecord::Base
  belongs_to :beehive
  has_many :measurements
	self.inheritance_column = nil
end
