class Beehive < ActiveRecord::Base
  belongs_to :user
  has_many :sensors

  def modeString
  	[ "Invalid","Summer","Winter"]
  end

end
