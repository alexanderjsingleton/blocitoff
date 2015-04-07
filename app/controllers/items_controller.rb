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

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    name = @item.name
  

    if @item.destroy
      flash[:notice] = "Item was removed."
      redirect_to list_path(@list)
    else
      flash[:error] = "Item couldn't be deleted.  Please try again."
      redirect_to list_path(@list)
    end

    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end



  private

  def item_params
    params.require(:item).permit(:name)
  end

 
end
