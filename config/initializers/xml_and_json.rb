module ActiveRecord
  class Base
    def self.customize_xml_and_json(options)
      class_eval <<-CODE
        def to_xml(options = {})
          super(options.merge(#{options.inspect}))
        end
        def to_json(options = {})
          super(options.merge(#{options.inspect}))
        end
      CODE
    end
  end
end