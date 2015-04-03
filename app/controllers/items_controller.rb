class ItemsController < ApplicationController
   
   def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list

    if @item.save
     redirect_to list_path(@list), notice: "To-do saved."
    else
      flash[:error] = "Error saving To-do - please try again."
      render :new
    end
  end


   def new
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list

    if @item.save
     redirect_to list_path(@list), notice: "To-do saved."
    else
      flash[:error] = "Error saving To-do - please try again."
      render :new
    end
  end



  private

  def item_params
    params.require(:item).permit(:name)
  end

 
end
