class CategoriesController < ApplicationController
  def index
  	@category = Category.find_by(slug: params[:slug2]) if params[:slug2].present?
    @category = Category.find_by(slug: params[:slug1]) if params[:slug1].present? && params[:slug2].blank?
  	@category = nil if params[:slug1].blank? && params[:slug2].blank?
  	@parent_cat = Category.originals
  	redirect_to root_path, flash: {error: I18n.t(:page_not_exist_error, scope: :message)} and return if @category.blank?
  end
end
