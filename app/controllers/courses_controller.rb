class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = current_user.courses
  end

  def show
    @course = Course.find params[:id]
  end

  def new
    @course = current_user.courses.new
  end

  def edit
    @course = current_user.courses.find(params[:id])
    end

  def create
    @course = current_user.courses.create(course_params)
    #build?
    render 'show'
  end

  def update
    @course = current_user.courses.find(params[:id])
    if @course.update(course_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @course = current_user.courses.find params[:id]
    @course.destroy
    redirect_to user_courses_path(current_user)
  end

  private
  def course_params
    params.require(:course).permit(:name, :end_date, :public)
  end
end