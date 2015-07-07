class ImportantsController < ApplicationController
  def index    
    @course = Course.find(params[:course_id])
    @importants = @course.importants.all
  end

  def show
    @course = Course.find(params[:course_id])
    @important = @course.importants.find(params[:id])
    @importants = @course.importants.all ##
  end

  def new
    @course = Course.find(params[:course_id])
    @important = @course.importants.new
  end

  def edit
    @course = Course.find(params[:course_id])
    @important = @course.importants.find(params[:id])
    @edit = true 
  end

  def create
    @course = Course.find(params[:course_id])
    @important = @course.importants.create(important_params)
    @importants = @course.importants.all
    # render 'index'
    redirect_to user_course_path(current_user, @course) ####
  end

  def update
    @course = Course.find(params[:course_id])
    @important = @course.importants.find(params[:id])
    
    @importants = @course.importants.all

    if @important.update(important_params)
      # render 'index'
      redirect_to user_course_path(current_user, @course) 
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @important = @course.importants.find(params[:id])
    @important.destroy
    # redirect_to course_tdls_path(@course)
    redirect_to user_course_path(current_user, @course)
  end

  private
      def important_params
        params.require(:important).permit(:date, :event, :remarks ).merge(user_id: current_user.id)
      end
end


