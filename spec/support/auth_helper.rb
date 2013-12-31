module AuthHelper

  def log_admin
    @admin = create(:admin)
    visit '/private'
    fill_in 'admin_email', :with => @admin.email
    fill_in 'admin_password', :with => @admin.password
    click_button "M'identifier"
  end

end
