module Scam
  def self.included(base)
    base.extend(ClassMethods)
    base.class.send(:include, Enumerable)
    base.class_eval do
      attr_accessor(:id)
    end
  end

  module ClassMethods
    def create(attrs={})
      new(attrs).tap { |i| instances << i }
    end

    def each
      instances.each { |i| yield(i) }
    end

    def find(id)
      detect { |i| i.id == id.to_i }
    end

    alias [] find

    def instances
      @instances ||= []
    end
    private :instances
  end

  def initialize(attrs={})
    attrs.each { |key, value| send("#{key}=", value) }
  end
end
