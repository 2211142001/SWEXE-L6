class CartItemsController < ApplicationController
  before_action :check_product, only: [ :new, :create ]

  def new
    @cart_item = CartItem.new
    @cart_item.product = Product.find(params[:id])
  end

  def create
    @cart_item = CartItem.new(quantity: params[:cart_item][:quantity])
    @cart_item.product = Product.find(params[:id])

    if @cart_item.save
      flash[:message] = "商品をカートに追加しました"
      redirect_to products_index_path
    else
      flash[:message] = "商品をカートに追加できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:message] = "商品をカートから削除しました"
    else
      flash[:message] = "商品をカートから削除できませんでした"
    end
    redirect_to carts_index_path
  end

  private

  def check_product
    unless params[:id].present? && Product.exists?(params[:id])
      flash[:message] = "登録しようとした商品が見つかりませんでした"
      redirect_to products_index_path
    end
  end
end
