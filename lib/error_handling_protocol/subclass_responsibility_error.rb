module ErrorHandlingProtocol

  class SubclassResponsibilityError < NameError

    def self.instance_side_responsibility_error_message a_method_name, a_subclass
      self.responsibility_to_implement_method_error_message a_method_name, :instance, a_subclass
    end

    def self.class_side_responsibility_error_message a_method_name, a_subclass
      self.responsibility_to_implement_method_error_message a_method_name, :class, a_subclass
    end

    def self.responsibility_to_implement_method_error_message a_method_name, a_message_side, a_subclass
      "#{a_subclass} had the responsibility to implement :#{a_method_name} #{a_message_side} method."
    end


    def self.to_implement_instance_method_on a_method_name, a_subclass_instance
      self.new self.instance_side_responsibility_error_message(a_method_name, a_subclass_instance.class), a_method_name
    end

    def self.to_implement_class_method_on a_method_name, a_subclass
      self.new self.class_side_responsibility_error_message(a_method_name, a_subclass), a_method_name
    end

  end

end
