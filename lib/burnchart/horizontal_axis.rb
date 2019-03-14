module Burnchart

  class HorizontalAxis
    include AxisSupport

    def render left:, right:, top:, bottom:, canvas:
      canvas.line x1: left, y1: top, x2: right, y2: top, style: 'stroke:black;'

      lower = @options[:value_lower_bound]
      upper = @options[:value_upper_bound]
      increment = @options[:px_between_ticks]
      font_size_px = @options[:font_size_px]

      major_tick_bottom_edge = top + @options[:major_tick_length]
      minor_tick_bottom_edge = top + @options[:minor_tick_length]

      ticks.each do |x, is_major_tick, label|
        tick_bottom_edge = (is_major_tick ? major_tick_bottom_edge : minor_tick_bottom_edge)
        canvas.line x1: x+left, y1: top, x2: x+left, y2: tick_bottom_edge, style: 'stroke:black;'
        if @options[:display_value_for_major_ticks] && is_major_tick
          canvas.text label, 
            x: x +left - (label_width(label)/2), y: major_tick_bottom_edge + font_size_px,
            style: "font: italic #{font_size_px}px sans-serif"
        end
      end
    end

    def preferred_size
      height = @options[:major_tick_length]
      if @options[:display_value_for_major_ticks]
        height += @options[:font_size_px]
      end

      Size.new(
        height: height,
        width: (@options[:value_upper_bound] * @options[:px_between_ticks]).to_i
      )
    end

  end
end