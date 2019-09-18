ActiveAdmin.register Category do

  permit_params :name, :parent_id, :order, :description, :slug

  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
