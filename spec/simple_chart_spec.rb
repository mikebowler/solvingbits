# frozen_string_literal: true

require 'spec_helper'

module SolvingBits
  class MockAxis
    def initialize height:, width:
      @preferred_size = Size.new(height: height, width: width)
    end

    def preferred_size
      @preferred_size
    end

    def render viewport
      viewport.canvas.rect(
        x: viewport.left,
        y: viewport.top,
        width: viewport.width,
        height: viewport.height,
        style: 'stroke:red'
      )
    end

    def top_pad
      0
    end
  end

  RSpec.describe SimpleChart do
    it 'should size based on both axis' do
      chart = SimpleChart.new
      chart.left_axis = MockAxis.new height: 100, width: 200
      chart.bottom_axis = MockAxis.new height: 300, width: 400
      expect(chart.preferred_size).to eq Size.new(height: 400, width: 600)
    end

    it 'should position based on both axis' do
      chart = SimpleChart.new
      chart.left_axis = MockAxis.new height: 100, width: 200
      chart.bottom_axis = MockAxis.new height: 300, width: 400

      expect(chart.to_svg :partial).to eq(
        "<rect x='0' y='0' width='200' height='100' style='stroke:red'/>" \
        "<rect x='200' y='100' width='400' height='300' style='stroke:red'/>"
      )
    end
  end
end