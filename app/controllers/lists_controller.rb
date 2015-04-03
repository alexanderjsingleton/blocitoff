class ListsController < ApplicationController

  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    
    if @list.save
     redirect_to list_path(@list), notice: "List saved."
    else
      flash[:error] = "Error saving list - please try again."
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end