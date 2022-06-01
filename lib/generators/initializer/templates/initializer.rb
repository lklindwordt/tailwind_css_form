# frozen_string_literal: true

TailwindCssForm.configure do |config|
  config.button_classes = %w[inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500]
  config.check_box_classes = %w[focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded]
  config.check_box_group_classes = %w[relative flex items-start]
  config.check_box_label_wrapper_classes = %w[ml-3 text-sm]
  config.check_box_wrapper_classes = %w[flex items-center h-5]
  config.collection_check_boxes_classes = %w[mb-2]
  config.field_classes = %w[shadow-sm block border w-full h-10 px-3 py-2 sm:text-sm rounded-md]
  config.field_error_classes = %w[border-red-300 text-red-900 placeholder-red-300 focus:outline-none focus:ring-red-500 focus:border-red-500 pr-10]
  config.field_regular_classes = %w[border-gray-300 focus:ring-indigo-500 focus:border-indigo-500]
  config.field_error_icon_classes = %w[h-5 w-5 text-red-500]
  config.field_error_icon_wrapper_classes = %w[absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none]
  config.field_error_message_classes = %w[mt-2 text-sm text-red-600]
  config.field_wrapper_classes = %w[mt-1]
  config.field_wrapper_error_classes = %w[relative rounded-md shadow-sm]
  config.rich_text_area_classes = %w[trix-content min-h-10]
end
