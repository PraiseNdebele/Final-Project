class CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    user_id = params[:user_id].to_i
    user = User.find(user_id)
    @courses = user.courses
  end

  def show
    @course = Course.find(params[:id])
    user_id = params[:user_id].to_i
    user = User.find(user_id)
    @courses = user.courses
    @tdls = @course.tdls.all ##
    @importants = @course.importants.all ##
    @goals = @course.goals.all ##
    @uploads = @course.uploads.all ##

    @importants = @importants.order(:date).upcoming
    @next = @importants.first
    @importants = @course.importants.all
  end

  def new
    @course = current_user.courses.new
  end

  def edit
    @course = current_user.courses.find(params[:id])
  end

  def create
    @course = current_user.courses.create(course_params)
    redirect_to user_course_path(current_user, @course)
  end

  def update
    @course = current_user.courses.find(params[:id])
    if @course.update(course_params)
      redirect_to user_course_path(current_user, @course)
    else
      render 'edit'
    end
  end

  def destroy
    @course = current_user.courses.find(params[:id])
    @course.destroy
    redirect_to user_courses_path(current_user)
  end

  private
  def course_params
    params.require(:course).permit(:name, :end_date, :public)
  end
end
