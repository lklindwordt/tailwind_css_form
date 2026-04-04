# frozen_string_literal: true

module TailwindCssForm
  module Inputs
    module ComboboxField
      extend ActiveSupport::Concern
      include Base

      included do
        def combobox(name, choices = nil, selected = nil, options = {}, html_options = {})
          options = options.merge({ wrapper: wrapper_options(options), group: group_options(options) })

          selected_obj = choices.select { |choice| choice[:id] == selected }.first
          selected_obj ||= choices.first if options.key?(:include_blank) && !options[:include_blank]

          field_group_builder(name, options) do
            concat(hidden_field(name, value: selected_obj.present? ? selected_obj[:id] : "", data: field_data(options)))
            concat(select_button(name, selected_obj, options, html_options))
            concat(select_list(name, choices, selected_obj, options, html_options))
          end
        end

        def wrapper_options(options)
          options[:wrapper] ||= {}
          options[:wrapper].merge({ class: extend_wrapper_classes(options) })
        end

        def group_options(options)
          options[:group] ||= {}
          options[:group].merge({ data: { controller: "combobox", "combobox-filter-value": filter?(options) } })
        end

        def field_data(options)
          data = {}
          data = options[:data] if options.key?(:data)
          data.merge({ "combobox-target": "input" })
        end

        def select_button(name, selected, options, html_options)
          tag.button(type: "button", class: button_classes(name, options, html_options),
                     aria: { haspopup: "listbox", expanded: true, labelledby: "combobox-label" }, data: select_button_data(options, html_options)) do
            concat(selected_option(selected, options))
            concat(selection_arrow)
          end
        end

        def select_list(_name, choices, selected, _options, html_options)
          return if disabled?(html_options)

          tag.ul(class: select_list_classes, tabindex: "-1", role: "combobox",
                 aria: { labelledby: "combobox-label", activedescendant: "combobox-option-3" }, data: { "combobox-target": "list" }) do
            choices.each do |choice|
              concat(list_option(choice, selected))
            end
          end
        end

        def list_option(choice, selected)
          chosen = choice[:id] == selected[:id] unless selected.nil?

          tag.li(class: list_option_classes, role: "option",
                 data: { action: "click->combobox#selected", "combobox-target": "option", id: choice[:id], name: choice[:name] }) do
            tag.div(class: option_span_classes) do
              concat(option_img(choice)) if choice.key?(:img)
              concat(option_name(choice, chosen))
              concat(option_sub(choice, chosen)) if choice.key?(:sub)
              concat(option_chosen(chosen))
            end
          end
        end

        def option_img(choice)
          return if choice.nil?
          return unless choice.key?(:img)

          if choice[:img][0] == "<"
            choice[:img].html_safe
          else
            tag.img(src: choice[:img])
          end
        end

        def option_name(choice, _chosen)
          classes = []
          classes.concat TailwindCssForm.config.combo_box_option_name_classes
          classes.concat TailwindCssForm.config.combo_box_option_img_classes if choice&.key?(:img)

          tag.span(class: classes) do
            choice.present? ? choice[:name] : ""
          end
        end

        def option_sub(choice, _chosen)
          classes = []
          classes.concat TailwindCssForm.config.combo_box_option_sub_classes
          # classes += ' font-semibold' if chosen

          tag.span(class: classes) do
            "(#{choice[:sub]})"
          end
        end

        def option_input(choice)
          classes = []
          classes.concat TailwindCssForm.config.combo_box_option_input_classes
          classes.concat TailwindCssForm.config.combo_box_option_img_classes if choice&.key?(:img)

          tag.input(type: "text", value: choice.present? ? choice[:name] : "", class: classes,
                    data: { "combobox-target": "filter", action: "input->combobox#input" })
        end

        def option_chosen(chosen)
          classes = []
          classes.concat TailwindCssForm.config.combo_box_option_chosen_classes
          classes.concat TailwindCssForm.config.combo_box_option_visible_classes if chosen
          classes.concat TailwindCssForm.config.combo_box_option_hidden_classes unless chosen

          tag.span(class: classes) do
            '<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clip-rule="evenodd" />
            </svg>'.html_safe
          end
        end

        def selected_option(selected, options)
          tag.span(class: option_span_classes) do
            concat(option_img(selected))
            concat(option_input(selected)) if filter?(options)
            concat(option_name(selected, false)) unless filter?(options)
          end
        end

        def selection_arrow
          tag.span(class: selection_span_classes) do
            '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-4 w-4 text-gray-600">
              <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
            </svg>'.html_safe
          end
        end

        def extend_wrapper_classes(options)
          classes = ["relative"]
          classes.concat options[:wrapper][:class].split if options&.key?(:wrapper) && options[:wrapper]&.key?(:class)

          classes.join(" ")
        end

        def button_classes(name, options, html_options)
          classes = field_classes(name, options).split
          classes.delete("py-1")

          classes.concat TailwindCssForm.config.combo_box_button_classes
          classes.concat TailwindCssForm.config.combo_box_button_disabled_classes if disabled?(html_options)

          classes
        end

        def option_span_classes
          TailwindCssForm.config.combo_box_option_span_classes.join(" ")
        end

        def selection_span_classes
          TailwindCssForm.config.combo_box_selection_span_classes.join(" ")
        end

        def select_list_classes
          TailwindCssForm.config.combo_box_select_list_classes.join(" ")
        end

        def list_option_classes
          TailwindCssForm.config.combo_box_select_list_option_classes.join(" ")
        end

        private

        def disabled?(html_options)
          html_options.key?(:disabled) == true
        end

        def filter?(options)
          options.key?(:filter) && options[:filter]
        end

        def select_button_data(options, html_options)
          data = { "combobox-target": "button" }
          unless disabled?(html_options)
            data = data.merge({ action: "click->combobox#toggle" })
            data[:action] += " click@window->combobox#toggle" if filter?(options)
          end

          data
        end
      end
    end
  end
end
