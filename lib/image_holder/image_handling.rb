module ImageHolder
  module ClassMethods
    def has_attached_image(*args)
      column = args[0].to_sym
      class_name = self.name.downcase.pluralize
      self.send(:define_method, "save_#{column}_image".to_sym) {
        #if the value is not a file then return
        if self.send(column).nil? or self.send(column).class != ActionDispatch::Http::UploadedFile
          self.send("#{column.to_s}=", args[-1][:default])
          return
        end
        #uploaded tempfile
        image = self.send(column).tempfile
        #id of instance being crated
        index = self.class.last.nil? ? 1 : self.class.last.id + 1
        #extension of file
        ext = self.send(column).original_filename.split('.')[-1]
        #filename to be saved as
        filename = column.to_s + index.to_s + '.' + ext
        #making directory
        `mkdir -p #{Rails.root}/app/assets/images/#{class_name}/#{index}`
        #moving image from temp storage to assets
        `mv #{image.path} #{Rails.root}/app/assets/images/#{class_name}/#{index}/#{filename}`
        #changing data in column to the path of image
        self.send("#{column.to_s}=", "#{class_name}/#{index}/#{filename}")
        #scaling the image
        #scaling should be in new thread, if possible
        #maybe a *to do* for new thread
        ImageScaling.scale_image("#{Rails.root}/app/assets/images/#{class_name}/#{index}/#{filename}", args[-1][:scale]) if args[-1].is_a?(Hash) and args[-1][:scale]
      }
      #this method is called before save of any instance
      self.send(:before_save, "save_#{column}_image".to_sym)
    end
  end
  ActiveRecord::Base.send(:extend, ClassMethods)
end