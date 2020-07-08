#
class AdminsController < ApplicationController
  # BEGIN: before_action section
  before_action :may_show_admin, only: [:show]
  before_action :may_index_admin, only: [:index]
  # END: before_action section

  # BEGIN: ACTION SECTION
  def show
    @admin = Admin.find(params[:id])
  end

  # BEGIN: index
  def index
    @admins = Admin.all
    @admins = @admins.order('name asc').page(params[:page]).per(50)
    @admins_count = @admins.count
  end
  # END: index
  # END: ACTION SECTION

  private

  # BEGIN: private section
  def may_show_admin
    return redirect_to(root_path) unless admin_signed_in? == true
  end
  helper_method :may_show_admin

  def may_index_admin
    may_show_admin
  end
  helper_method :may_index_admin
  # END: private section
end
