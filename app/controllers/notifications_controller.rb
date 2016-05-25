class NotificationsController < ApplicationController

  rescue_from StandardError do |exception|
    trigger_sms_alerts(exception)
  end

  def trigger_sms_alerts
    @alert_message = "
      [This is a test] ALERT!
      It appears the server is having issues.
      Exception:.
      Go to: http://newrelic.com for more details."
   # @image_url = "http://howtodocs.s3.amazonaws.com/new-relic-monitor.png"

    @admin_list = YAML.load_file('config/administrators.yml')

    begin
      @admin_list.each do |admin|
        phone_number = admin['phone_number']
        res = send_message(phone_number, @alert_message)
        puts "jfhvbhnmk"
      end

    #  flash[:success] = "Exception: #{e}. Administrators will be notified."
    rescue
      puts "abcdddddd"
     # flash[:alert] = "Something when wrong."
    end

    #redirect_to '/'
  end

  def index
  end

  def server_error
    raise 'A test exception'
  end

  private

  def send_message(phone_number, alert_message)
    puts "inside send messagggggeeee"

    @twilio_number = 9738919611
    @client = Twilio::REST::Client.new "AC9ff4b3e0b889bcea5b7c4ef6d16f8fa7", "1f20252745f469e34d48fe6e0e61013a"

    message = @client.account.messages.create(
        :from => "+12566485030",
        :to => '+91 97389 19611',
        :body => alert_message,
    # US phone numbers can make use of an image as well.
    # :media_url => image_url
    )
    puts message.to
  end

end