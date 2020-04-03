# Decorator pattern comes into play when simple inheritance failed to serve the purpose. We need has_a relationship instead
# of is_a relationship(For example a Bird(Derived class instance) is an Animal(Base class instance)). It strictly implements
# composition to extend behaviour. In short a decorator wraps objects over one another. For better understanding it is preferred
# to first understand design principle OPEN-CLOSED principle.

# A real life example is when a coffee is served in cafe, user can enable add-ons like extra cream, chocolate cake, whip etc.
# So that the final end product is a coffee object decorated with these add-ons with help of Decorator class/interface
# This scenario is explained thoroughly inside Chapter 5 of linked-in course
# https://www.linkedin.com/learning/programming-foundations-design-patterns-2/

class Component
  def operation
    raise NotImplementedError
  end
end


class ConcreteComponent < Component
  def operation
    'ConcreteComponent'
  end
end

class Decorator
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def operation
    @component.operation
  end
end

class ConcreteDecoratorA < Decorator
  def operation
    "ConcreteDecoratorA(#{@component.operation})"
  end
end

class ConcreteDecoratorB < Decorator
  def operation
    "ConcreteDecoratorB(#{@component.operation})"
  end
end

def client_code(component)
  print "RESULT: #{component.operation}"
end

simple = ConcreteComponent.new
puts 'Client: I\'ve got a simple component'
client_code(simple)
puts "\n\n"
decorator1 = ConcreteDecoratorA.new(simple)
decorator2 = ConcreteDecoratorB.new(decorator1)
puts 'Client: Now I\'ve got a decorated component:'
client_code(decorator2)
