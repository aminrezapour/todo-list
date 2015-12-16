class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item save successfully"
    else
      flash[:error] = "Item failed to save"
    end

    respond_to do |format|
      format.html
      format.js
    end
    
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end

end
