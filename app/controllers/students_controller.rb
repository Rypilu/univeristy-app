class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You have successfully singed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  # this is whitelisting these params. This is required by Rails >= V4
  def student_params
    params.require(:student).permit(:name, :email)
  end

end