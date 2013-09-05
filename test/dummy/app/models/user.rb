class User < ActiveRecord::Base
  has_attached_image :logo, default: 'default_user_log.png', scale: 80
end
