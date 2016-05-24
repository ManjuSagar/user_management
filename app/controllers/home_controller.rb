class HomeController < ApplicationController

  def home
    if current_user
      if current_user.role == 'manager'
        redirect_to managers_path
      elsif current_user.role == 'NS'
        redirect_to normal_index_path
      else
        redirect_to employees_path
      end
    end
  end

end