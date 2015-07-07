class UploadsController < ApplicationController
  def index    
    @course = Course.find(params[:course_id])
    @uploads = @course.uploads.all
  end

  def show
    @course = Course.find(params[:course_id])
    @upload = @course.uploads.find(params[:id])
    @uploads = @course.uploads.all ##
  end

  def new
    @course = Course.find(params[:course_id])
    @upload = @course.uploads.new
  end

  def edit
    @course = Course.find(params[:course_id])
    @upload = @course.uploads.find(params[:id])
    @edit = true 
  end   

  def create
    @course = Course.find(params[:course_id])
    @upload = @course.uploads.create(upload_params)
    @uploads = @course.uploads.all
    # render 'index'
    redirect_to user_course_path(current_user, @course) ####
  end

  def update
    @course = Course.find(params[:course_id])
    @upload = @course.uploads.find(params[:id])
    
    @uploads = @course.uploads.all

    if @upload.update(upload_params)
      # render 'index'
      redirect_to user_course_path(current_user, @course) 
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @upload = @course.uploads.find(params[:id])
    @upload.destroy
    # redirect_to course_tdls_path(@course)
    redirect_to user_course_path(current_user, @course)
  end

  private
      def upload_params
        params.require(:upload).permit(:document).merge(user_id: current_user.id)
      end
end


