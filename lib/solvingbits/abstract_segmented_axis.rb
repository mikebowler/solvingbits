# frozen_string_literal: true

module SolvingBits
  class AbstractSegmentedAxis
    include Configurable

    attr_configurable :segments_keys, defaults_to: []
    attr_configurable :segments_height_px, defaults_to: 10
    attr_configurable :segments_width_px, defaults_to: 10
    attr_configurable :segments_font_size_px, defaults_to: 13

    # attr_configurable :formatter

    # attr_configurable :label_text
    # attr_configurable :label_visible, defaults_to: false, only: [true, false]
    # attr_configurable :label_font_size_px, defaults_to: 13


    def initialize params
      initialize_configuration params: params
    end
  end
end