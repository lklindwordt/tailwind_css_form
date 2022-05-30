# frozen_string_literal: true

module TailwindCssForm
  class Configuration

    def button_classes=(attr)
      @button_classes = attr
    end

    def button_classes
      @button_classes || %w[flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-sky-800 hover:bg-cyan-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-cayn-600]
    end

    def check_box_classes(attr)
      @check_box_classes = attr
    end

    def check_box_classes
      @check_box_classes || %w[focus:ring-cyan-600 h-4 w-4 text-cyan-600 border-gray-300 rounded]
    end

    def check_box_group_classes=(attr)
      @check_box_group_classes = attr
    end

    def check_box_group_classes
      @check_box_group_classes || %w[relative flex items-start]
    end

    def check_box_label_wrapper_classes(attr)
      @check_box_label_wrapper_classes = attr
    end

    def check_box_label_wrapper_classes
      @check_box_label_wrapper_classes || %w[ml-3 text-sm]
    end

    def check_box_wrapper_classes(attr)
      @check_box_wrapper_classes = attr
    end

    def check_box_wrapper_classes
      @check_box_wrapper_classes || %w[flex items-center h-5]
    end

    def collection_check_boxes_classes(attr)
      @collection_check_boxes_classes = attr
    end

    def collection_check_boxes_classes
      @collection_check_boxes_classes || %w[mb-2]
    end

    def field_classes=(attr)
      @field_classes = attr
    end

    def field_classes
      @field_classes || %w[appearance-none block w-full h-10 px-3 py-2 border rounded-md shadow-sm focus:outline-none sm:text-sm]
    end

    def field_error_classes=(attr)
      @field_error_classes = attr
    end

    def field_error_classes
      @field_error_classes || %w[border-red-300 placeholder-gray-400 focus:ring-red-500 focus:border-red-500 pr-10]
    end

    def field_regular_classes=(attr)
      @field_regular_classes = attr
    end

    def field_regular_classes
      @field_regular_classes || %w[border-gray-300 placeholder-gray-400 focus:ring-cyan-600 focus:border-cyan-600]
    end

    def field_error_icon_classes=(attr)
      @field_error_icon_classes = attr
    end

    def field_error_icon_classes
      @field_icon_classes || %w[h-5 w-5 text-red-500]
    end

    def field_error_icon_wrapper_classes=(attr)
      @field_error_icon_wrapper_classes = attr
    end

    def field_error_icon_wrapper_classes
      @field_error_icon_wrapper_classes || %w[absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none]
    end

    def field_error_message_classes=(attr)
      @field_error_message_classes = attr
    end

    def field_error_message_classes
      @field_error_message_classes || %w[mt-2 text-sm text-red-600]
    end
    
    def field_wrapper_classes=(attr)
      @field_wrapper_classes = attr
    end

    def field_wrapper_classes
      @field_wrapper_classes || %w[mt-1]
    end

    def field_wrapper_error_classes=(attr)
      @field_wrapper_error_classes = attr
    end

    def field_wrapper_error_classes
      @field_wrapper_error_classes || %w[relative rounded-md shadow-sm]
    end

    def rich_text_area_classes=(attr)
      @rich_text_area = attr
    end

    def rich_text_area_classes
      @rich_text_area || %w[trix-content min-h-10]
    end

  end
end