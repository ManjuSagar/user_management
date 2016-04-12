class ManagersController < ApplicationController

   def index
     @tasks = Task.all.where(:assigned_by=> current_user.id)
   end
end