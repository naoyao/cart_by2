class CartItemsController < ApplicationController

    # before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

    def show
      @cart_items = current_user.cart_items
    end

    # 商品一覧画面から、「商品購入」を押した時のアクション
    def new
      # binding.pry
      if @cart_item.blank?
        @cart_item = current_user.cart_items.build(product_id: params[:product_id])
      end

      @cart_item.quantity += params[:quantity].to_i
      @cart_item.save
      redirect_to current_user
    end

    # カート詳細画面から、「更新」を押した時のアクション
    def update
      @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to current_user
    end

  　# カート詳細画面から、「削除」を押した時のアクション
    def delete
      @cart_item.destroy
      redirect_to current_user
    end

    private
    def setup_cart_item!
      @cart_item = current_user.cart_items.find_by(product_id: params[:product_id])
    end

end
