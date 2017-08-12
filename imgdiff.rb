#!/usr/bin/ruby

require 'chunky_png'
include ChunkyPNG::Color

images = [
  ChunkyPNG::Image.from_file('old.png'),
  ChunkyPNG::Image.from_file('new.png')
]

output = ChunkyPNG::Image.new(images.first.width, images.last.height, WHITE)

images.first.height.times do |y|
  images.first.row(y).each_with_index do |pixel, x|

    score = Math.sqrt(
        (r(images.last[x,y]) - r(pixel)) ** 2 +
        (g(images.last[x,y]) - g(pixel)) ** 2 +
        (b(images.last[x,y]) - b(pixel)) ** 2
      ) / Math.sqrt(MAX ** 2 * 3)

    output[x,y] = to_grayscale(images.last[x,y])

    if score > 0
      diff = (r(images.last[x,y]) - r(pixel)) + 
        (g(images.last[x,y]) - g(pixel)) +
        (b(images.last[x,y]) - b(pixel))
      if diff > 0
        output[x,y] = rgb(MAX,0,0)
      else
        output[x,y] = rgb(0,MAX,0)
      end
    end
  end
end

output.save('diff.png')


