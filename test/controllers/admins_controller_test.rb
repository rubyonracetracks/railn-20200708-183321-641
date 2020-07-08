require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  # BEGIN: SHOW
  # BEGIN: show-public
  test 'should redirect profile page when not logged in' do
    get admin_path(@a1)
    assert_redirected_to root_path
    get admin_path(@a2)
    assert_redirected_to root_path
    get admin_path(@a3)
    assert_redirected_to root_path
    get admin_path(@a4)
    assert_redirected_to root_path
    get admin_path(@a5)
    assert_redirected_to root_path
    get admin_path(@a6)
    assert_redirected_to root_path
  end
  # END: show-public

  # BEGIN: show-user
  test 'should redirect users from profile page' do
    sign_in @u1, scope: :user
    get admin_path(@a1)
    assert_redirected_to root_path
    get admin_path(@a2)
    assert_redirected_to root_path
    get admin_path(@a3)
    assert_redirected_to root_path
    get admin_path(@a4)
    assert_redirected_to root_path
    get admin_path(@a5)
    assert_redirected_to root_path
    get admin_path(@a6)
    assert_redirected_to root_path
  end
  # END: show-user

  # BEGIN: show-regular_admin
  test 'should not redirect profile page when logged in as a regular admin' do
    sign_in @a4, scope: :admin
    get admin_path(@a1)
    assert_response :success
    get admin_path(@a2)
    assert_response :success
    get admin_path(@a3)
    assert_response :success
    get admin_path(@a4)
    assert_response :success
    get admin_path(@a5)
    assert_response :success
    get admin_path(@a6)
    assert_response :success
  end
  # END: show-regular_admin

  # BEGIN: show-super_admin
  test 'should not redirect profile page when logged in as a super admin' do
    sign_in @a1, scope: :admin
    get admin_path(@a1)
    assert_response :success
    get admin_path(@a2)
    assert_response :success
    get admin_path(@a3)
    assert_response :success
    get admin_path(@a4)
    assert_response :success
    get admin_path(@a5)
    assert_response :success
    get admin_path(@a6)
    assert_response :success
  end
  # END: show-super_admin
  # END: SHOW
end
