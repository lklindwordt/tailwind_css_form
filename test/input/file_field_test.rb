# frozen_string_literal: true

require_relative "../test_helper"

class FileFieldTest < Minitest::Test
  def setup
    @builder = form_builder
  end

  def test_creates_file_input_type
    result = @builder.file_field(:avatar)
    assert_match(/type="file"/, result)
    assert_match(/name="user\[avatar\]"/, result)
  end

  def test_accepts_accept_option
    result = @builder.file_field(:avatar, accept: "image/*")
    assert_match(%r{accept="image/\*"}, result)
  end

  def test_supports_multiple_files
    result = @builder.file_field(:avatar, multiple: true)
    assert_match(/multiple="multiple"/, result)
  end

  def test_accepts_direct_upload_option
    result = @builder.file_field(:avatar, direct_upload: true)
    # direct_upload is a Rails-specific option that doesn't appear in HTML
    assert_match(/type="file"/, result)
  end
end
