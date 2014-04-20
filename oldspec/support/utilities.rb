include ApplicationHelper

def full_title(page_title)
  base_title = "BandBlitz"
  if page_title.empty?
	base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Login"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def sign_in(user)
  visit login_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Login"
  # Login when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end