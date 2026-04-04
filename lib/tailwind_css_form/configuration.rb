# frozen_string_literal: true

module TailwindCssForm
  class Configuration
    attr_accessor :button_classes, :check_box_classes, :check_box_group_classes, :check_box_label_wrapper_classes,
                  :check_box_wrapper_classes, :collection_check_boxes_classes, :field_classes, :field_error_classes,
                  :field_disabled_classes, :field_regular_classes, :field_error_icon_classes,
                  :field_error_icon_wrapper_classes, :field_error_message_classes, :field_wrapper_classes,
                  :field_wrapper_error_classes, :rich_text_area_classes, :radio_button_classes,
                  :radio_button_wrapper_classes, :combo_box_button_classes, :combo_box_button_disabled_classes,
                  :combo_box_option_name_classes, :combo_box_option_sub_classes, :combo_box_option_input_classes,
                  :combo_box_option_chosen_classes, :combo_box_option_img_classes, :combo_box_option_visible_classes,
                  :combo_box_option_hidden_classes, :combo_box_option_span_classes, :combo_box_selection_span_classes,
                  :combo_box_select_list_classes, :combo_box_select_list_option_classes

    def initialize
      @button_classes = []
      @check_box_classes = []
      @check_box_group_classes = []
      @check_box_label_wrapper_classes = []
      @check_box_wrapper_classes = []
      @collection_check_boxes_classes = []
      @field_classes = []
      @field_error_classes = []
      @field_disabled_classes = []
      @field_regular_classes = []
      @field_error_icon_classes = []
      @field_error_icon_wrapper_classes = []
      @field_error_message_classes = []
      @field_wrapper_classes = []
      @field_wrapper_error_classes = []
      @rich_text_area_classes = []
      @radio_button_classes = []
      @radio_button_wrapper_classes = []
      @combo_box_button_classes = []
      @combo_box_button_disabled_classes = []
      @combo_box_option_name_classes = []
      @combo_box_option_sub_classes = []
      @combo_box_option_input_classes = []
      @combo_box_option_chosen_classes = []
      @combo_box_option_img_classes = []
      @combo_box_option_visible_classes = []
      @combo_box_option_hidden_classes = []
      @combo_box_option_span_classes = []
      @combo_box_selection_span_classes = []
      @combo_box_select_list_classes = []
      @combo_box_select_list_option_classes = []
    end
  end
end
