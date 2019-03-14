module Burnchart

  class SimpleChart
    def left_axis= axis
      @y_axis = axis
    end

    def bottom_axis= axis
      @x_axis = axis
    end

    def preferred_size
      x_size = @x_axis.preferred_size
      y_size = @y_axis.preferred_size

      Size.new height: x_size.height + y_size.height, width: x_size.width + y_size.width
    end

    def to_svg svg_flavour = :full
      c_size = preferred_size
      x_size = @x_axis.preferred_size
      y_size = @y_axis.preferred_size

      canvas = SvgCanvas.new
      @y_axis.render(
        left: 0, 
        right: y_size.width, 
        top: 0, 
        bottom: y_size.height, 
        canvas: canvas
      )
      @x_axis.render(
        left: y_size.width, 
        right: c_size.width, 
        top: y_size.height, 
        bottom: c_size.height, 
        canvas: canvas
      )
      # canvas.dump_svg_for_test
      canvas.to_svg svg_flavour
    end
  end
end