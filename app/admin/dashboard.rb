# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          table_for User.order("id desc").limit(10).each do |_user|
            column(:email) { |user| link_to(user.email, admin_user_path(user)) }
          end
        end
      end

      column do
        panel "Recent Activities" do
          table_for Activity.order("id desc").limit(10).each do |_activity|
            column(:title) { |activity| link_to(activity.title, admin_user_path(activity)) }
          end
        end
      end
    end
  end
end
