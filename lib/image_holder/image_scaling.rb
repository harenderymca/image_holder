module ImageHolder
  module ImageScaling

    require 'RMagick'

    def self.scale_image(path, scale)
      img = Magick::Image.read(path).first
      target = Magick::Image.new(scale, scale) do
        self.background_color = 'white'
      end
      img.resize_to_fit!(scale, scale)
      target.composite(img, Magick::CenterGravity, Magick::CopyCompositeOp).write(path)
    end

  end
end