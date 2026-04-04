# frozen_string_literal: true

require_relative "../test_helper"

class DateFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_date_input_type
    result = @builder.date_field(:date_of_birth)
    assert_match(/type="date"/, result)
    assert_match(/name="user\[date_of_birth\]"/, result)
  end

  def test_accepts_min_option
    result = @builder.date_field(:date_of_birth, min: "1900-01-01")
    assert_match(/min="1900-01-01"/, result)
  end

  def test_accepts_max_option
    result = @builder.date_field(:date_of_birth, max: "2026-12-31")
    assert_match(/max="2026-12-31"/, result)
  end
end
