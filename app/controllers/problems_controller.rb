class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @problems = Problem.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
    respond_with(@problems)
  end

  def show
    respond_with(@problem)
  end

  def new
    @problem = current_user.problems.build
    respond_with(@problem)
  end

  def edit
  end

  def create
    @problem = current_user.problems.build(problem_params)
    @problem.save
    respond_with(@problem)
  end

  def update
    @problem.update(problem_params)
    respond_with(@problem)
  end

  def destroy
    @problem.destroy
    respond_with(@problem)
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
    end
    
    def correct_user
      @problem = current_user.problems.find_by(id: params[:id])
      redirect_to problems_path, notice: "That isn't your problem.  No touchy." if @problem.nil?
    end

    def problem_params
      params.require(:problem).permit(:description, :user_id)
    end

end
