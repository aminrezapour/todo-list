class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      flash.now[:notice] = "Item save successfully"
    else
      flash.now[:error] = "Item failed to save"
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
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
