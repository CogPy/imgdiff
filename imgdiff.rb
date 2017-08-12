#!/usr/bin/ruby

require 'chunky_png'
include ChunkyPNG::Color

images = [
  ChunkyPNG::Image.from_file(ARGV[1]),
  ChunkyPNG::Image.from_file(ARGV[0])
]

output = ChunkyPNG::Image.new(images.first.width, images.last.height)

images.first.height.times do |y|
  images.first.row(y).each_with_index do |pixel, x|

    score = Math.sqrt(
        (r(images.last[x,y]) - r(pixel)) ** 2 +
        (g(images.last[x,y]) - g(pixel)) ** 2 +
        (b(images.last[x,y]) - b(pixel)) ** 2
      ) / Math.sqrt(MAX ** 2 * 3)

    output[x,y] = fade(images.last[x,y], (MAX*1.0).floor)

    if score > 0
      diff = (r(images.last[x,y]) - r(pixel)) + 
        (g(images.last[x,y]) - g(pixel)) +
        (b(images.last[x,y]) - b(pixel))
      if diff > 0
          fg = rgba(MAX,0,0, (MAX*0.5).floor)
      else
          fg = rgba(0,MAX,0, (MAX*0.5).floor)
      end
      output[x,y] = compose_quick(fg, output[x,y])
    end
  end
end

output.save(ARGV[2])


