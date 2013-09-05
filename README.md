Image Holder
============

Image holder is image upload and management tool for Rails.

It is light and does not do anything else than resizing and saving the image file.

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
Example
-------
Lets say you have a User model with attr *name* and *logo*
```ruby
class User < ActiveRecord::Base
  attr_accessor :name, :logo
  
  has_attached_image :logo, default: 'default_user_logo.png', scale: 60
end
```
### In view
```
views/users/_form.html.erb
```
```
<%= form_for @user --- %>
----
----
<%= f.file_field :logo %>
----
----
<%= submit_tag %>
```

### In Controller
Nothing special, just usual 
```
app/controllers/users_controller.rb
```
```ruby
def create
---
---
  @user.save
---
---
end
```
### Image location
Image will be located in 
```
app/assets/images/users/logo<@user.id>.extension
```
### Use Image
The *logo* column in users table will store the path of image(*logo in this example*)

Inside view template do:
```ruby
<%=  image_tag @user.logo %>
```

