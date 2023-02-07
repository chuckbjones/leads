module ValidUserHelper
  def signed_in_as_a_valid_user
    @user ||= FactoryGirl.create :user
    sign_in @user # method from devise:TestHelpers
  end
end

# module for helping request specs
module ValidUserRequestHelper
  # for use in request specs
  def sign_in_as_a_valid_user
    @user ||= FactoryBot.create(:user)
    # post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    post user_session_path, params: {
      user: {
        email: @user.email, password: @user.password
      }
    }
    follow_redirect!
  end
end

RSpec.configure do |config|
  config.include ValidUserHelper, type: :controller
  config.include ValidUserRequestHelper, type: :request
end
