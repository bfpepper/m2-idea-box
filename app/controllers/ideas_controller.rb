class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      flash[:success] = "#{idea.title} has been created!"
      redirect_to idea_path(idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @idea.update
      flash[:success] = "#{@idea.title} has been updated!"
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = "#{@idea.title} has been deleted!"
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :categoy_id)
  end

end
