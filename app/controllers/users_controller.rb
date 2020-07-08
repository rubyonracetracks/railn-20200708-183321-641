#
class UsersController < ApplicationController
  # BEGIN: before_action section
  before_action :may_show_user, only: [:show]
  before_action :may_index_user, only: [:index]
  # END: before_action section

  # BEGIN: ACTION SECTION
  def show
    @user = User.find(params[:id])
  end

  # BEGIN: index
  # BEGIN: index
  # rubocop:disable Metrics/AbcSize
  def index
    @search = User.ransack(params[:q].presence)
    # NOTE: The following line specifies the sort order.
    # This is reflected in the default sort criteria shown.
    # The user is free to remove these default criteria.
    @search.sorts = 'name asc' if @search.sorts.empty?
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    @users = @search.result
    @users_count = @users.count
    @users = @users.page(params[:page]).per(50)
  end
  # rubocop:enable Metrics/AbcSize
  # END: index
  # END: index
  # END: ACTION SECTION

  private

  # BEGIN: private section
  def correct_user
    current_user == User.find(params[:id])
  end

  def admin_or_correct_user
    correct_user || admin_signed_in?
  end
  helper_method :admin_or_correct_user

  def may_show_user
    return redirect_to(root_path) unless admin_or_correct_user
  end
  helper_method :may_show_user

  def may_index_user
    return redirect_to(root_path) unless admin_signed_in?
  end
  helper_method :may_index_user
  # END: private section
end
