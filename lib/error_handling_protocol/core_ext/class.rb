class Class

  def subclass_responsibility
    raise ErrorHandlingProtocol::SubclassResponsibilityError.to_implement_class_method_on calling_method_name, self
  end

end