class EmployeesController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @employee = User.new
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

