class NormalController < ApplicationController

  def index
  end

  def show
    data = []
    @current_month_tasks = Task.includes(:user).where(:assigned_by=> current_user.id, :month=> params[:month], :year=> params[:year]).collect{|x| {:date=> x.start_date, :title=> x.title, :desc=> x.description}}
    #@current_month_tasks = Task.all.where(:assigned_by => current_user.id, :month=> params["month"], :year=> params["year"])
    tasks_group_by_date = @current_month_tasks.group_by{|k| k[:date]}
    tasks_group_by_date.each do |task|
      task_data = []
      task_title = []
       for i in 1..task.length
           task_data = task[i].collect { |x| x[:desc] } if task[i].present?
           task_title = task[i].collect { |x| x[:title] } if task[i].present?
       end
      body_html = "<table class=\"table table-bordered\"><thead><tr><th class=\"lead\">Title:</th><th class=\"lead\">Description:</th><tr></thead><br/><tbody>"
      task_title.each_with_index do |t, index|
        body_html += "<tr><th>#{t}</th><th>#{task_data[index]}</th></tr><br/>"
      end
      body_html += "</tbody></table>"
     data << {"date":"#{task[0]}", "badge": true, "title": "Your Tasks For Date #{task[0]}",
          "body": body_html.html_safe}
    end
    respond_to do |format|
      format.json do
        render :json => data
      end
    end
  end

end