class Task < ActiveRecord::Base
  belongs_to :user

  def self.task_to_run_at_seven_in_the_morning
    puts "insideeeeeeeeeeeeee"
    todays_task_users = User.includes(:tasks).where("tasks.start_date"=> Date.today)
    todays_task_users.each do |user|
      UserMailer.task_email(user).deliver_now
    end
  end

  def self.send_message()
    puts "inside send messagggggeeee"

    @client ||= Twilio::REST::Client.new "AC9ff4b3e0b889bcea5b7c4ef6d16f8fa7", "2437926c1bdf8b512f766b74a512d2df"

    message = @client.account.messages.create(
        :from => "+12566485030",
        :to => '+91 97389 19611',
        :body => "heloooo test",
    # US phone numbers can make use of an image as well.
    # :media_url => image_url
    )
    puts message.to
  end

end