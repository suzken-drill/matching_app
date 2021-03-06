class Owners::OwnerShopsController < ApplicationController
  before_action :authenticate_owner!
  before_action :find_shop, only: [:edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, flash: { error: I18n.t(:shop_not_exist_error, scope: :message) }
  end

  def index
    @shops = current_owner.shops
  end

  def new
    @shop = Shop.new
    @shop.build_category_relationship
    @shop.shop_payments.build
  end

  def create
    @shop = current_owner.shops.new(shop_params)
    if @shop.save
      flash[:notice] = I18n.t(:owner_shop_create, scope: [:message, :owner_shop])
      redirect_to action: :index
    else
      flash.now[:error] = I18n.t(:form_error, scope: :message)
      render action: :new
    end
  end

  def edit
    unless current_owner.shops.include?(@shop)
      flash[:error] = I18n.t(:owner_not_authority_error, scope: :message)
      redirect_to root_path and return
    end
  end

  def update
    redirect_to root_path, notice: I18n.t(:owner_not_authority_error, scope: :message) and return unless current_owner.shops.include?(@shop)
    if @shop.update_attributes(shop_params)
      flash[:notice] = I18n.t(:owner_shop_update, scope: [:message, :owner_shop])
      redirect_to action: :index
    else
      flash.now[:error] = I18n.t(:form_error, scope: :message)
      render action: :edit
    end
  end

  def destroy
    @shop.destroy
    flash[:notice] = I18n.t(:owner_shop_destroy, scope: [:message, :owner_shop])
    redirect_to action: :index
  end

  private
    def find_shop
      @shop = Shop.find(params[:id])
    end
    def shop_params
      params.require(:shop).permit(
        Shop::REGISTRABLE_ATTRIBUTES +
        [category_relationship_attributes: CategoryRelationship::REGISTRABLE_ATTRIBUTES] +
        [payment_ids: []] +
        [shop_photos_attributes: ShopPhoto::REGISTRABLE_ATTRIBUTES]
      )
    end
end
