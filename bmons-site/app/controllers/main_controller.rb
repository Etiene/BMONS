class MainController < ApplicationController



  def index
    colors = ["#C60800","#FCD21C","#2222ff","#16B84E","#DFAF2C"]

    @beehives = Beehive.where(user_id: current_user.id)
    @data = Array.new()
    @dataString = "["
    @beehives.each do |beehive| 
      str = "["
      c = 0
      beehive.sensors.each do |sensor| 

        str = str + "{ key: \"#{sensor.name} (#{sensor.unity})\", color: \"#{colors[c]}\", values: [ "
        sensor.measurements.each do |measurement| 
          str = str + "{x:#{(measurement.datetime).to_time.to_i},y:#{measurement.value}}, "
          
        end 
        c = (c + 1)%5
      str = str + ' ]},'
      end 
    @data << str
    @dataString = @dataString + str + "],"
    end
    @dataString = @dataString + "]"
  end



  def admin
  	if current_user.access_level != 99
  		render :text => 'Access denied.', :status => '303'
  	end
  end

   def adminBecomeUser
    return unless current_user.access_level == 99
    sign_in(:user, User.find(params[:id]))
    redirect_to root_url # or user_root_url
  end


  def checkAlerts

  end
end
