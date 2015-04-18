class Object

  def subclass_responsibility
    raise ErrorHandlingProtocol::SubclassResponsibilityError.to_implement_instance_method_on calling_method_name, self
  end

  def calling_method_name
    collaboration_location_in_defining_method = caller[1]

    method_name = collaboration_location_in_defining_method[/.+in `(.+)'/, 1]

    method_name.to_sym
  end

end