#
class AdminsController < ApplicationController
  # BEGIN: before_action section
  before_action :may_show_admin, only: [:show]
  # END: before_action section

  # BEGIN: ACTION SECTION
  def show
    @admin = Admin.find(params[:id])
  end
  # END: ACTION SECTION

  private

  # BEGIN: private section
  def may_show_admin
    return redirect_to(root_path) unless admin_signed_in? == true
  end
  helper_method :may_show_admin
  # END: private section
end
