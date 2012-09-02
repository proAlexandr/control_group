require "control_group/version"

module BootstrapHelper

  def control_group f, field_name, input_type = nil, *options, &block
    help = nil #options.is_a?(Hash) ? options.delete(:help) : nil TODO: Fix it
    label_field_name = [field_name].flatten.first
    input_field_name = [field_name].flatten.last

    content_tag :div, :class => "control-group" do
      raw([
              f.label(label_field_name, :class => "control-label"),

              if block_given?
                content_tag :div, :class => "controls", &block
              else
                content_tag(:div, :class => "controls") do
                  raw([
                          f.send(input_type, input_field_name, *options),
                          help && content_tag(:p, help, :class => "help-block")
                      ].join(" "))
                end
              end,
          ].join(" "))
    end
  end

end
