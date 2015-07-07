class GoalsController < ApplicationController
  def index    
    @course = Course.find(params[:course_id])
    @goals = @course.goals.all
  end

  def show
    @course = Course.find(params[:course_id])
    @goal = @course.goals.find(params[:id])
    @goals = @course.goals.all ##
  end

  def new
    @course = Course.find(params[:course_id])
    @goal = @course.goals.new
  end

  def edit
    @course = Course.find(params[:course_id])
    @goal = @course.goals.find(params[:id])
    @edit = true 
  end

  def create
    @course = Course.find(params[:course_id])
    @goal = @course.goals.create(goal_params)
    @goals = @course.goals.all
    # render 'index'
    redirect_to user_course_path(current_user, @course) ####
  end

  def update
    @course = Course.find(params[:course_id])
    @goal = @course.goals.find(params[:id])
    
    @goals = @course.goals.all

    if @goal.update(goal_params)
      # render 'index'
      redirect_to user_course_path(current_user, @course) 
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @goal = @course.goals.find(params[:id])
    @goal.destroy
    # redirect_to course_tdls_path(@course)
    redirect_to user_course_path(current_user, @course)
  end

  private
      def goal_params
        params.require(:goal).permit(:date, :details, :projected_mark, :actual_mark).merge(user_id: current_user.id)
      end
end


