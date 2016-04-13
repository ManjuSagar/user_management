class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
   Task.create(task_params.merge!(:assigned_by=> current_user.id, :user_id=> task_params[:assigned_to], :year=> task_params["start_date(1i)"],
                                   :month=> task_params["start_date(2i)"]))
   redirect_to :managers
  end

  def get_engaged_list
     @task = User.joins(:tasks).where("tasks.assigned_by = ? and start_date = ?", current_user.id, params[:date]).collect{|x| x.first_name + " "+ x.last_name}
     respond_to do |format|
       format.json do
         render :json => {
                    :data=> @task
                }
       end
     end
  end

  def show
    data = []
    @current_month_tasks = Task.includes(:user).where(:assigned_by=> current_user.id, :month=> params[:month], :year=> params[:year]).group_by(&:start_date).collect {|x| [x[0], x[1].collect{|y| y.user.first_name}]}
    @current_month_tasks.each do |task|
      data << {"date":"#{task[0]}", "badge": true, "title": "Engaged List", "body":"<p class=\"lead\">"+ task[1].uniq.join(",  ")+"<\/p>"}
    end
    respond_to do |format|
      format.json do
        render :json => data
      end
    end
  end

  def manager_tasks
    data = [
             {
               :date=> "2016-04-25", :badge => true, :title => "Tonight", :body => "<p class=\"lead\">Party<\/p><p>Like it's 1999.<\/p>"
             }
           ]
    render data
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :assigned_to, :start_date)
  end

end