class DestinationsController < ApplicationController

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_input)
    if @destination.save
      redirect_to user_path(current_user.id), notice: '配送先住所を登録しました'
    else
      render :new
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    if destination.destroy
      redirect_to user_path(current_user.id), notice: '配送先を削除しました'
    end
  end

  private

  def destination_input
    params.permit(:destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :post_code, :prefecture, :city, :address, :building_name, :phone_number, :user_id)
  end
end
