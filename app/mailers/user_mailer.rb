class UserMailer < ApplicationMailer
  default from: 'manjusagar.sn@gmail.com'

  def task_email(user)
    @user = user
    @tasks = user.tasks
    #@url  = 'http://example.com/login'
    mail(to: @user.email, subject: "Todays Tasks")
  end
end