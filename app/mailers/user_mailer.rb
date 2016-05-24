class UserMailer < ApplicationMailer
  default from: 'manjusagar.sn@gmail.com'

  def task_email(task, user)
    @user = user
    @task = task
    #@url  = 'http://example.com/login'
    mail(to: @user.email, subject: @task.start_date.to_s + "Tasks")
  end
end