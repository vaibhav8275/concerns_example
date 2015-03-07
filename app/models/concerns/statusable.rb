require 'active_support/concern'

module Statusable
  extend ActiveSupport::Concern
  
  included do
    def self.status_attrs(*args)
      options = args.extract_options!

      args.each do |s|
        define_method("status_#{s.to_s}?") {
          (status.to_s == s.to_s)
        }
        define_singleton_method("#{s.to_s}") {
          where(:status => s.to_s)
        }
        define_singleton_method("not_#{s.to_s}") {
          where("status != ?", s.to_s)
        }
      end
      
      define_singleton_method("statuses") do
        args
      end
      
      after_initialize do
        self.status = options.fetch(:default_status, nil).to_s if status.blank?
      end if options.has_key?(:default_status)
      
      validates :status, :inclusion => {:in => args.map(&:to_s) }
    end
  end
end