class Homework
  attr_accessor :status, :title

  def initialize(title)
    @title = title
    @status = 'set'
  end
end
