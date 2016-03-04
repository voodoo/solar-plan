class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :has_plan?, :my_plan

  protected

  def has_plan?
    session[:my_plan]  
  end

  def my_plan
    Plan.find(session[:my_plan]) if has_plan?
  end

  def set_my plan
    session[:my_plan] = plan.id 
  end

end
