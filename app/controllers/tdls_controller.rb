class TdlsController < ApplicationController
  def index    
    @course = Course.find(params[:course_id])
    @tdls = @course.tdls.all
  end

  def show
    @course = Course.find(params[:course_id])
    @tdl = @course.tdls.find(params[:id])
    @tdls = @course.tdls.all ##
  end

  def new
    @course = Course.find(params[:course_id])
    @tdl = @course.tdls.new
  end

  def edit
    @course = Course.find(params[:course_id])
    @tdl = @course.tdls.find(params[:id])
    @edit = true 
  end

  def create
    @course = Course.find(params[:course_id])
    @tdl = @course.tdls.create(tdl_params)
    @tdls = @course.tdls.all
    # render 'index'
    redirect_to user_course_path(current_user, @course) ####
  end

  def update
    @course = Course.find(params[:course_id])
    @tdl = @course.tdls.find(params[:id])
    
    @tdls = @course.tdls.all

    if @tdl.update(tdl_params)
      # render 'index'
      redirect_to user_course_path(current_user, @course) 
    else
      render 'edit'
    end
  end

  def complete
    course = Course.find(params[:course_id])
    if current_user == course.user
      @tdl = Tdl.find(params[:id])
      if @tdl.complete
        @tdl.complete = false
        @tdl.save
        redirect_to user_course_path(current_user, course)
      else
        @tdl.complete = true
        @tdl.save
        redirect_to user_course_path(current_user, course)
      end     
    else
      redirect_to root_path, alert: "Sorry, you do not have access!"
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @tdl = @course.tdls.find(params[:id])
    @tdl.destroy
    # redirect_to course_tdls_path(@course)
    redirect_to user_course_path(current_user, @course)
  end

  private
      def tdl_params
        params.require(:tdl).permit(:date, :task, :complete ).merge(user_id: current_user.id)
      end
end


