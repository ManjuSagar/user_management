class Task < ActiveRecord::Base
  belongs_to :user

  def self.task_to_run_at_seven_in_the_morning
    puts "insideeeeeeeeeeeeee"
    tasks = Task.all.where(:start_date=> Date.today)
    tasks.each do |task|
      puts "inside hdgvbhfdjk"
      UserMailer.task_email(task.user, task)
    end
  end
end