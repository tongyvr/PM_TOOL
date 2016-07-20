class DiscussionsController < ApplicationController

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion       = Discussion.new discussion_params
    if @discussion.save
      redirect_to discussions_path(@discussion), notice: "Discussion created!"
    else
      flash[:alert] = "Discussion not created!"
      render :new
    end
  end

  def index
    @discussions = Discussion.order(created_at: :desc)
  end

  def edit
    @discussion = Discussion.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:id]
    discussion_params
    if @discussion.update discussion_params
      redirect_to discussion_path(@discussion)
    else
      render :edit
    end
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to discussions_path, notice: "Discussion deleted"
  end

  def show
    @discussion = Discussion.find params[:id]
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :description, :due_date)
  end



end
