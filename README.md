# Concerns Example
Concerns are basically design patterns to move common behaviour, functionality into seprate models which can be included into any class.Rails concerns are available from Rails 3 but Rails 4 enforces use of concern by creating default 'concerns' directory inside models and controlers.


Some Example areas where concerns are useful.

1.)Commentable 

2.)Statusable

3.)Taggable

more..............

# app/models/product.rb
    class Product 
      include Taggable
      ..
    end

# app/models/concerns/taggable.rb
notice that the file name has to match the module name.

(applying Rails conventions for autoloading)

    module Taggable
      extend ActiveSupport::Concern
    
      included do
        has_many :taggings, as: :taggable
        has_many :tags, through: :taggings
    
        class_attribute :tag_limit
      end
    
      def tags_string
        tags.map(&:name).join(', ')
      end
    
      def tags_string=(tag_string)
        tag_names = tag_string.to_s.split(', ')
    
        tag_names.each do |tag_name|
          tags.build(name: tag_name)
        end
      end
    
      # methods defined here are going to extend the class, not the instance of it
      module ClassMethods
    
        def tag_limit(value)
          self.tag_limit_value = value
        end
    
      end
    end
