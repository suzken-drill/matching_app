class CategoriesController < ApplicationController
  def index
  	@category = Category.where(slug: params[:slug2]).first if params[:slug2].present?
    @category = Category.where(slug: params[:slug1]).first  if params[:slug1].present? && params[:slug2].blank?
  	@category = nil if params[:slug1].blank? && params[:slug2].blank?
  end
end
