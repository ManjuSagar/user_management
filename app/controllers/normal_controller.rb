class NormalController < ApplicationController

  def index
  end

  def show
    data = []
    @current_month_tasks = Task.includes(:user).where(:assigned_by=> current_user.id, :month=> params[:month], :year=> params[:year]).collect{|x| {:date=> x.start_date, :desc=> x.description}}
    #@current_month_tasks = Task.all.where(:assigned_by => current_user.id, :month=> params["month"], :year=> params["year"])
    tasks_group_by_date = @current_month_tasks.group_by{|k| k[:date]}
    tasks_group_by_date.each do |task|
      task_data = []
       for i in 1..task.length
           task_data << task[i].collect { |x| x[:desc] } if task[i].present?
       end
     data << {"date":"#{task[0]}", "badge": true, "title": "Your Tasks For Date #{task[0]}", "body":"<p class=\"lead\">"+ task_data.join('\n')+"<\/p>".html_safe}
    end
    respond_to do |format|
      format.json do
        render :json => data
      end
    end
  end

end