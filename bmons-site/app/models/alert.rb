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
  
  class << self # Class methods
	  def checkAlerts
	    alerts = Alert.all

	    alerts.each do |alert| 
	      last_log = AlertLog.where(alert_id: alert.id).last
	      produceAlert = false
	      # For each alert, see if there is already a message sent

	      if last_log
	      	diff = (Time.now - last_log.created_at).to_i / 60

	      	#send new message if the last message sent was sent too long ago 
	      	if diff > alert.frequency
	      		produceAlert = true
	      	end
	      #always send if there is no last message sent
	      else
	      	produceAlert = true
	      end
		  if produceAlert
		      last_measurement = Measurement.where(sensor_id: alert.sensor_id).last

		      #verify if last measurement is infringing alert configuration rules
		      if last_measurement and ((alert.comparison.to_i == 0 and last_measurement.value < alert.threshold) or (last_measurement and alert.comparison.to_i == 1 and last_measurement.value == alert.threshold) or (last_measurement and alert.comparison.to_i == 2 and last_measurement.value > alert.threshold))
		      	#send alert email
		      	sent = UserMailer.alert_email(alert.user,alert,last_measurement).deliver_now
		      	#register on log
		      	alertLog = AlertLog.new
		      	alertLog.message = alert.message
		      	alertLog.recipient = alert.user.email
		      	alertLog.alert_id = alert.id
		      	if sent 
		      		alertLog.status = 200
		      	else
		      		alertLog.status = 500
		      	end
		      	alertLog.save
		 	  else
		  	
		      end
		   end
	    end

	  end
   end

end
