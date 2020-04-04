# abstract subject class
class Subject
  def attach(_observer)
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end

  def detach(_observer)
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end

  def notify
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end
end

class ConcreteSubject < Subject
  attr_accessor :state
  def initialize
    @observer = []
  end

  def attach(observer)
    puts 'Subject: Attached an observer'
    @observer << observer
  end

  def detach(observer)
    @observer.delete(observer)
  end

  def notify
    puts 'Subject: Notifying observers...'
    @observer.each { |observer| observer.update(self) }
  end

  # some business logic
  def some_business_logic
    puts "\nSubject: I'm doing something important."
    @state = rand(0..10)
    puts "Subject: My state has just changed to: #{@state}"
    notify
  end
end

# abstract class
class Observer
  def update(_subject)
    raise NotImplementedError, "#{self.class} has not implemented' \
                               'method '#{__method__}'"
  end
end

class ConcreteObserverA < Observer
  def update(subject)
    puts 'ConcreteObserverA: Reacted to the event' if subject.state < 3
  end
end

class ConcreteObserverB < Observer
  def update(subject)
    return unless subject.state.zero? || subject.state >= 2

    puts 'ConcreteObserverB: Reacted to the event'
  end
end

# client code
subject = ConcreteSubject.new

observer_a = ConcreteObserverA.new
subject.attach(observer_a)

observer_b = ConcreteObserverB.new
subject.attach(observer_b)

subject.some_business_logic
subject.some_business_logic

subject.detach(observer_a)

subject.some_business_logic
