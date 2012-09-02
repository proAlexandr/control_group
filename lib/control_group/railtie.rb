require "control_group/view_helpers"

module ControlGroup

  class Railtie < Rails::Railtie
    initializer "control_group.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end

end