# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


every '* * * * *' do
	#runner "Alert.checkAlerts", :environment => 'development' #CHANGE ENVIRONMENT WHEN NECESSARY
	command "cd /home/bmons/BMONS/bmons-site && rails runner Alert.checkAlerts"
	command 'echo "Running checkAlerts 2" > /home/bmons/BMONS/bmons-site/cron.out'
end

