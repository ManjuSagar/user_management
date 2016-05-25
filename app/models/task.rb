class Task < ActiveRecord::Base
  belongs_to :user

  def self.task_to_run_at_seven_in_the_morning
    puts "insideeeeeeeeeeeeee"
    todays_task_users = User.includes(:tasks).where("tasks.start_date"=> Date.today)
    todays_task_users.each do |user|
      UserMailer.task_email(user).deliver_now
    end
  end
end