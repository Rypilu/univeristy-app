class LoginsController < ApplicationController

  def new

  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = "You have successfully logged in"
      redirect_to student
    else
      flash.now[:notice] = "Your email or password did not match our records"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end


end