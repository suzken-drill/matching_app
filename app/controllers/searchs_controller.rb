class SearchsController < ApplicationController
  # POST
  def index
  	@keyword = params[:keyword]
  	if params[:category].present?
      @category = Category.where(id: params[:category].to_i).first
      @shops = @category.shops
    else
      @shops = Shop.all
    end
    if @keyword.present?
      @shops = @shops.where("name like '%#{@keyword}%' OR description like '%#{@keyword}%'")
    end
    @shops = @shops.paginate(page: params[:page], per_page: 20)
  end

  #GET
  # def new
  # end
end
