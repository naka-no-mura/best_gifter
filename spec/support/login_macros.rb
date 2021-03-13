module LoginMacros
  def login_as(user)
    visit '/login'
      fill_in 'login-email', with: user.email
      fill_in 'login-password', with: 'password'
      click_on 'login-btn'
  end
end