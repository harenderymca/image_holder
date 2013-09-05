Image Holder
============

Image holder is image upload and management tool for Rails.
It is light and does not anything else than resizing and saving the image file.

Installation
------------
In Gemfile, add
```ruby
gem 'image_holder'
```

Usage
-----
In your model do :
```ruby 
class YourModel < ActiveRecord::Base
  has_attached_image :ATTR_NAME, default: 'DEFAULT_IMAGE.png', scale: SIZE
end
```
