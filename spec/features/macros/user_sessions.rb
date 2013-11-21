module AcceptanceMacros
  def find_or_create_user(admin: false)
    user = User.where(email: 'admin@example.com').first_or_create do |user|
      user.password              = 'secret123'
      user.password_confirmation = 'secret123'
    end

    user.update_column(:admin, true) if admin
  end

  def authenticate
    visit root_path

    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'secret123'
    click_button 'Sign in'
  end
end
