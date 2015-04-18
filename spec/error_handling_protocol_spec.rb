describe ErrorHandlingProtocol do

  class TestClass

    def instance_method_to_implement
      self.subclass_responsibility
    end

    def self.class_method_to_implement
      self.subclass_responsibility
    end

  end

  describe :subclass_responsibility do

    it 'reports to the user that an instance method should have been implemented' do
      expected_error_message = ErrorHandlingProtocol::SubclassResponsibilityError.instance_side_responsibility_error_message :instance_method_to_implement, TestClass

      expect{ TestClass.new.instance_method_to_implement }.to raise_error(ErrorHandlingProtocol::SubclassResponsibilityError) { |error|
        expect(error.message).to eq expected_error_message
        expect(error.name).to eq :instance_method_to_implement
      }
    end

    it 'reports to the user that a class method should have been implemented' do
      expected_error_message = ErrorHandlingProtocol::SubclassResponsibilityError.class_side_responsibility_error_message :class_method_to_implement, TestClass

      expect{ TestClass.class_method_to_implement }.to raise_error(ErrorHandlingProtocol::SubclassResponsibilityError) { |error|
        expect(error.message).to eq expected_error_message
        expect(error.name).to eq :class_method_to_implement
      }
    end

  end

end