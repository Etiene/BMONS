class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :sensor
  has_many :alert_logs

  def comparisonArray
  	[ "Less than","Equal to","Greater than"]
  end

  def messageTypeArray
  	[ "Email","SMS","Email and SMS"]
  end

end
