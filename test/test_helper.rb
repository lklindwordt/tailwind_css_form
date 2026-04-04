# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "minitest/autorun"
require "tailwind_css_form"
require "action_view"
require "action_pack"
require "active_model"
require "uri"

# Mock model for testing
class User
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :email, :bio, :password, :age, :color, :date_of_birth,
                :created_at, :wake_time, :role, :avatar, :rich_content, :country,
                :active, :interests, :gender

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, numericality: { greater_than_or_equal_to: 18 }, allow_nil: true

  def self.human_attribute_name(attr, _options = {})
    attr.to_s.humanize
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "User")
  end

  def persisted?
    false
  end
end

# Mock template for rendering forms
class MockTemplate
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Context

  def protect_against_forgery?
    false
  end
end

module TestHelper
  def template
    @template ||= MockTemplate.new
  end

  def user
    @user ||= User.new(
      name: "John Doe",
      email: "john@example.com",
      age: 25,
      bio: "A sample bio",
      country: "US"
    )
  end

  def user_with_errors
    @user_with_errors ||= User.new.tap(&:valid?) # Trigger validations
  end

  def form_builder(object = user, options = {})
    TailwindCssForm::FormBuilder.new(:user, object, template, options)
  end

  def reset_config
    TailwindCssForm.instance_variable_set(:@config, nil)
  end
end

module Minitest
  class Test
    include TestHelper
  end
end
