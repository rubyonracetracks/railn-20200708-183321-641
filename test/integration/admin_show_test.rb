require 'test_helper'

class AdminShowTest < ActionDispatch::IntegrationTest
  def check_profile_disabled(admin1)
    visit admin_path(admin1)
    assert page.has_css?('title', text: full_title(''),
                                  visible: false)
    assert page.has_css?('h1', text: 'Home', visible: false)
  end

  # rubocop:disable Metrics/AbcSize
  def check_own_profile(admin1)
    login_as(admin1, scope: :admin)
    visit root_path
    assert page.has_link?('Your Profile', href: admin_path(admin1))
    click_on 'Logout'
  end

  def check_profile_enabled(admin1)
    n = admin1.name
    un = admin1.username
    e = admin1.email
    visit admin_path(admin1)
    assert page.has_css?('title', text: full_title("Admin: #{n}"),
                                  visible: false)
    assert page.has_css?('h1', text: "Admin: #{n}",
                               visible: false)
    assert page.has_text?("Username: #{un}")
    assert page.has_text?("Email: #{e}")
  end
  # rubocop:enable Metrics/AbcSize

  test 'unregistered visitors may not view admin profile pages' do
    check_profile_disabled(@a1)
    check_profile_disabled(@a2)
    check_profile_disabled(@a3)
    check_profile_disabled(@a4)
    check_profile_disabled(@a5)
    check_profile_disabled(@a6)
  end

  test 'user may not view admin profile pages' do
    login_as(@u1, scope: :user)
    check_profile_disabled(@a1)
    check_profile_disabled(@a2)
    check_profile_disabled(@a3)
    check_profile_disabled(@a4)
    check_profile_disabled(@a5)
    check_profile_disabled(@a6)
  end

  test 'regular admin can view all admin profiles' do
    login_as(@a4, scope: :admin)
    check_profile_enabled(@a1)
    check_profile_enabled(@a2)
    check_profile_enabled(@a3)
    check_profile_enabled(@a4)
    check_profile_enabled(@a5)
    check_profile_enabled(@a6)
  end

  test 'super admin can view all admin profiles' do
    login_as(@a1, scope: :admin)
    check_profile_enabled(@a1)
    check_profile_enabled(@a2)
    check_profile_enabled(@a3)
    check_profile_enabled(@a4)
    check_profile_enabled(@a5)
    check_profile_enabled(@a6)
  end

  test 'admins can access their own profiles from the menu bar' do
    check_own_profile(@a1)
    check_own_profile(@a2)
    check_own_profile(@a3)
    check_own_profile(@a4)
    check_own_profile(@a5)
    check_own_profile(@a6)
  end
end
