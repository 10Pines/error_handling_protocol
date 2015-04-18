# ErrorHandlingProtocol

Provides common error messages in the protocol of class ```Object```.  
For example, to report the error that a subclass should have implemented one of the superclass's messages.

Inspired in Smalltalk's Error Handling Protocol.  
See [Smalltalk-80: The Language And Its Implementation](http://stephane.ducasse.free.fr/FreeBooks/BlueBook/Bluebook.pdf), Chapter 6, page 102.

## Installation

Add this line to your application's Gemfile:

    gem 'error_handling_protocol'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install error_handling_protocol

## Usage

Just ```require 'error_handling_protocol'```.

### Subclass Responsibility 

Report to the user that a method specified in the superclass of the receiver should have been implemented in the receiver's class.

#### Motivation

Ruby does not have a way to communicate a method should be implemented by a subclass.  
Either the method is not defined at all in the superclass, or it is implemented by throwing some kind of error.

The first alternative is not good at all because the model fails to communicate whether the message is part of the hierarchy's procotol or not, and because the method was not defined in the superclass, a ```NoMethodError``` will be raised.

The problem with that is ambiguity: it is not clear if the object was not expected to respond to the message, or if someone forgot to implement it.  
That means *is the developer's job to read the class definition* to clear that out, on a case-by-case basis.

The second alternative communicates better the fact that a message is part of the hierarchy's protocol by explicitly informing which method a subclass was supposed to  implement, freeing the developer from doing that task manually.
The downside is that the error raising collaborations will quickly be duplicated all over the codebase (i.e. ```fail 'implement me'```).

The ```:subclass_responsibility``` message addresses this issue by providing a reusable message developers can use to communicate better their intentions when designing classes.   
The error raised when sent, ```SubclassResponsibilityError```, provides detailed information about the method that should have been implemented, the subclass responsible to do it, and whether the method should be an instance or class one.

#### Example: communicating subclasses are responsible to implement an instance method
```ruby
class A
    def m1
        self.subclass_responsibility
    end
end

class B < A
end
```
Sending the ```:m1``` message to an instance of ```B``` yields:

```ruby
B.new.m1
```
```ruby
ErrorHandlingProtocol::SubclassResponsibilityError: B had the responsibility to implement :m1 class method.
```

#### Example: communicating subclasses are responsible to implement a class method

```ruby
class C
    def self.m2
        self.subclass_responsibility
    end
end

class D < C
end
```

Sending the ```:m2``` message to ```D``` yields:

```ruby
D.m2
```

```ruby
ErrorHandlingProtocol::SubclassResponsibilityError: D had the responsibility to implement :m2 class method.
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/error_handling_protocol/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Developed & maintained by [10 Pines](http://development.10pines.com)
