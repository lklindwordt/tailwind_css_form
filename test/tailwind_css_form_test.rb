require_relative "./test_helper"

class TailwindCssFormTest < ActionView::TestCase
  include TailwindCssForm::ActionViewExtensions::FormHelper

  test 'default stlye form' do 
    expected = <<~HTML
      <form class="space-y-6" id="form_project" action="/projects" accept-charset="UTF-8" method="post">
        
      </form>
    HTML
    received = tailwind_css_form_for(@user) { |_f| nil }
    byebug
  end
end