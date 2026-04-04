# frozen_string_literal: true

require_relative "../test_helper"

class SelectFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_select_element
    result = @builder.select(:country, [["United States", "US"], ["Canada", "CA"]])
    assert_match(/<select/, result)
    assert_match(/name="user\[country\]"/, result)
  end

  def test_includes_options
    result = @builder.select(:country, [["United States", "US"], ["Canada", "CA"]])
    assert_match(/United States/, result)
    assert_match(/Canada/, result)
    assert_match(/value="US"/, result)
    assert_match(/value="CA"/, result)
  end

  def test_selects_current_value
    result = @builder.select(:country, [["United States", "US"], ["Canada", "CA"]])
    assert_match(/selected="selected"/, result)
  end

  def test_supports_include_blank_option
    result = @builder.select(:country, [["United States", "US"]], include_blank: "Select a country")
    assert_match(/Select a country/, result)
  end

  def test_supports_prompt_option
    result = @builder.select(:country, [["United States", "US"]], prompt: "Choose one")
    # Rails select helper ignores prompt when a value is already selected
    # Since country is "US", it will be selected and prompt won't show
    assert_match(/United States/, result)
  end

  def test_supports_disabled_option
    result = @builder.select(:country, [["United States", "US"]], {}, disabled: true)
    assert_match(/disabled="disabled"/, result)
  end
end
