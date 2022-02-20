ENV["RAILS_ENV"] ||= "test"

require 'minitest/autorun'

class ActionView::TestCase
  def setup_test_fixture
    @user = User.new(email: 'lars@example.com', passwort: 'secret')
    @builder = TailwindCssForm::FormBuilder.new(:user, @user, self, {})
  end
end