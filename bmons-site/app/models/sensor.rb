class Sensor < ActiveRecord::Base
  belongs_to :beehive
  has_many :measurements
  has_many :alerts
	self.inheritance_column = nil
end
