# frozen_string_literal: true

TailwindCssForm.configure do |config|
  config.button_classes = %w[flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm
                             font-medium text-white bg-sky-800 hover:bg-cyan-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cayn-600]
  config.check_box_classes = %w[focus:ring-cyan-600 h-4 w-4 text-cyan-600 border-gray-300 rounded]
  config.check_box_group_classes = %w[relative flex items-start]
  config.check_box_label_wrapper_classes = %w[ml-3 text-sm]
  config.check_box_wrapper_classes = %w[flex items-center h-5]
  config.collection_check_boxes_classes = %w[mb-2]
  config.field_classes = %w[appearance-none block w-full h-10 px-3 py-2 border rounded-md shadow-sm focus:outline-none
                            sm:text-sm]
  config.field_error_classes = %w[border-red-300 placeholder-gray-400 focus:ring-red-500 focus:border-red-500 pr-10]
  config.field_regular_classes = %w[border-gray-300 placeholder-gray-400 focus:ring-cyan-600 focus:border-cyan-600]
  config.field_error_icon_classes = %w[h-5 w-5 text-red-500]
  config.field_error_icon_wrapper_classes = %w[absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none]
  config.field_error_message_classes = %w[mt-2 text-sm text-red-600]
  config.field_wrapper_classes = %w[mt-1]
  config.field_wrapper_error_classes = %w[relative rounded-md shadow-sm]
  config.rich_text_area_classes = %w[trix-content min-h-10]
end
