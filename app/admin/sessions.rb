ActiveAdmin.register Session do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :start_at, :activity_id, :room_url, :running
  #
  # or
  #
  # permit_params do
  #   permitted = [:start_at, :activity_id, :room_url, :running]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :start_at
end
