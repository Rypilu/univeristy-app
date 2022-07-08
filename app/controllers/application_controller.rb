class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    # "||=" or "or-equals" is being used for Memoization
    # This uses a logical OR (||) between left and right values, then assigns the result to the variable on the left.
    # With this design, we will only perform the expensive DB query if @current_user doesn't exist - allowing us to skip a db lookup.
    # https://www.honeybadger.io/blog/ruby-rails-memoization/
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    # !! turns this into a bool
    !!current_user
  end

end
