class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @solutions = Solution.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
    respond_with(@solutions)
  end

  def show
    respond_with(@solution)
  end

  def new
    @solution = current_user.solutions.build
    respond_with(@solution)
  end

  def edit
  end

  def create
    @solution = current_user.solutions.build(solution_params)
    @solution.save
    respond_with(@solution)
  end

  def update
    @solution.update(solution_params)
    respond_with(@solution)
  end

  def destroy
    @solution.destroy
    respond_with(@solution)
  end

  private
    def set_solution
      @solution = Solution.find(params[:id])
    end

    def correct_user
      @solution = current_user.solutions.find_by(id: params[:id])
      redirect_to solutions_path, notice: "That isn't your solution.  No touchy." if @solution.nil?
    end

    def solution_params
      params.require(:solution).permit(:description, :user_id)
    end
end
