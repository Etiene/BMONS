class Sensor < ActiveRecord::Base
  belongs_to :beehive
	self.inheritance_column = nil
end
