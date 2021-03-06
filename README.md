# Concerns Example
Concerns are basically design patterns to move common behaviour, functionality into seprate models which can be included into any class.Rails concerns are available from Rails 3 but Rails 4 enforces use of concern by creating default 'concerns' directory inside models and controlers.

The idea is to extract common and / or context specific chunks of code in order to clean up the models and avoid them getting too fat and messy.

Some Example areas where concerns are useful.

1.)Commentable 

2.)Statusable

3.)Taggable

more..............

# How to run above app?

download or clone above example

    bundle install
    bundle exec rake db:migrate
    rails c

# create some products
    Product.create(:name => 'Pen', :cost => 20, :quantity_in_stock => 10,:quantity_on_order => 2)
    Product.create(:name => 'Book', :cost => 100, :quantity_in_stock => 20,:quantity_on_order => 10)
    Product.create(:name => 'Bag', :cost => 200, :quantity_in_stock => 30,:quantity_on_order => 30,:status =>'out_of_stock')


# Class methods
    Prodcut.in_stock
    Product.out_of_stock
    Product.not_out_of_stock

# Instance Methods
    Product.last.status_in_stock?
    Product.first.status_in_stock?
    Product.last.status_out_of_stock?

# More Example and some explanation about code

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

# class_attribute

class_attribute(*attrs) public

Declare a class-level attribute whose value is inheritable by subclasses. Subclasses can change their own value and it will not impact parent class.

    class Base
      class_attribute :setting
    end
    
    class Subclass < Base
    end
    
    Base.setting = true
    Subclass.setting            # => true
    Subclass.setting = false
    Subclass.setting            # => false
    Base.setting                # => true
