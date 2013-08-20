include ApplicationHelper

# With the code in Listing 8.34, we can write
# it { should have_error_message('Invalid') }
# and
# describe "with valid information" do
#   let(:user) { FactoryGirl.create(:user) }
#   before { valid_signin(user) }
#   .
#   .
#   .

def valid_signin(user)
  fill_in "Email", 		with: user.email
  fill_in "Password", 	with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
  	expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end
