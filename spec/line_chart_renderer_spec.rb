# frozen_string_literal: true

require 'spec_helper'

module SolvingBits

  RSpec.describe LineChartRenderer do
    it 'draw simple line' do
      canvas = SvgCanvas.new 
      renderer = LineChartRenderer.new line_type: 'straight'
      renderer.data_points = [
        Point.new(x: 4, y: 5),
        Point.new(x: 6, y: 7)
      ]
      renderer.render Viewport.new left: 0, right: 100, top: 0, bottom: 100, canvas: canvas

      expect(canvas.to_svg :partial).to eq(
        "<line x1='4' y1='5' x2='6' y2='7' style='stroke:red'></line>"
      )
    end
  end
end