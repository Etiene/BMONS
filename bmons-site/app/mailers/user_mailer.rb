class UserMailer < ApplicationMailer
	default from: 'enstabmons@gmail.com'
	def alert_email(user,alert,measurement)
    @user = user
    @alert = alert
    @measurement = measurement
    mail(to: @user.email, subject: '[BMONS] Hive alert!')
  end
end
