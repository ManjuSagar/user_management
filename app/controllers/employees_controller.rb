class EmployeesController < ApplicationController

  def index
    #@tasks = Task.all.where(:assigned_to=> current_user.id)
  end

  def show
    data = []
    @current_month_tasks = Task.all.where(:assigned_to=> current_user.id, :month=> params["month"], :year=> params["year"]).collect{|x| [x.start_date, x.title, x.description]}
    @current_month_tasks.each do |task|
      data << {"date":"#{task[0]}", "badge": true, "title": "Task Info", "body":"<h6>Title:</h6><p class=\"lead\">"+ task[1]+"<\/p> <h6>Description:</h6><p class=\"lead\">"+ task[2]+"<\/p>"}
    end
    respond_to do |format|
      format.json do
        render :json => data
      end
    end
  end

  def new
    @emply = User.new
  end

  def create
    puts "inside createeeeeeeeee"
    User.create(employee_params.merge!(:role=> 'employee', :password=> "test1234"))
    redirect_to :managers
  end


  private

  def employee_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end

