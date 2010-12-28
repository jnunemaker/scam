module Support
  module Constants
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def uses_constants(*constants)
        before { create_constants(*constants) }
      end
    end

    def create_constants(*constants)
      constants.each { |constant| create_constant(constant) }
    end

    def remove_constants(*constants)
      constants.each { |constant| remove_constant(constant) }
    end

    def create_constant(constant)
      remove_constant(constant)
      Object.const_set(constant, Model(constant))
    end

    def remove_constant(constant)
      Object.send(:remove_const, constant) if Object.const_defined?(constant)
    end

    def Model(name=nil)
      Class.new.tap do |model|
        model.class_eval """
          def self.name; '#{name}' end
          def self.to_s; '#{name}' end
        """ if name
        model.send(:include, Scam)
      end
    end
  end
end