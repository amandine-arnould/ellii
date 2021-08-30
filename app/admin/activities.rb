ActiveAdmin.register Activity do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :duration, :remote, :user_id, :min_participants, :max_participants, :mind, :address, :admin_validation, :latitude, :longitude
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :duration, :remote, :user_id, :min_participants, :max_participants, :mind, :address, :admin_validation, :latitude, :longitude]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title, :description, :duration, :remote, :max_participants, :min_participants, :address, :mind, :latitude, :longitude, :admin_validation
end
