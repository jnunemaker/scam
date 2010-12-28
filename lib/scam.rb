module Scam
  def self.included(base)
    base.class_eval do
      class << self
        include Enumerable
      end
      attr_accessor :id
    end
    base.extend(ClassMethods)
  end

  module ClassMethods
    def all
      instances.sort_by { |i| i.send(sorted_by) }
    end

    def sorted_by(attribute=nil)
      @sorted_by = attribute unless attribute.nil?
      @sorted_by = :id if @sorted_by.nil?
      @sorted_by
    end

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

  def eql?(other)
    other.class == self.class && other.id == id
  end

  alias == eql?
end
