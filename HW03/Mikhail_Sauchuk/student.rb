# student take a new tasks and put it into backlog
# he can do homeworks only one by one
# when he do one homework to send notification to mentor
# student recieves notification from mentor about his checked tasks
# and if task need to be updated puts this task into backlog
# and removes it from the list of homeworks

require_relative 'abstract_observer'

class Student < AbstractObserver
  attr_accessor :mentors, :backlog

  def initialize(name, surname)
    super(name, surname)
    @mentors = []
    @backlog = []
  end

  def attach(mentor)
    puts "Student #{surname}: Subscribes to mentor #{mentor.surname}"
    mentors << mentor
  end

  def detach(mentor)
    mentors.delete(mentor)
  end

  def notify(homework)
    puts "Student #{surname}: Notifying mentors"
    mentors.each { |mentor| mentor.update(self, homework) }
  end

  def update(checked_hm)
    my_homeworks = checked_hm.find_all { |hm| homeworks.include? hm }
    return if my_homeworks.empty?

    puts "Student #{surname}: I recived my homework(s) back"
    my_homeworks.each do |hm|
      next unless hm.status == 'reject'

      puts "Student #{surname}: I need to fix #{hm.title}"
      update_backog(hm)
    end
  end

  def update_backog(reject_homework)
    homeworks.delete(reject_homework)
    backlog << reject_homework
  end

  def take_homework(homework)
    puts "Student #{surname}: I take a homework #{homework.title}"
    @backlog << homework
  end

  # carry out the homework
  def do_homework
    return if @backlog.empty?

    current_homework = @backlog.delete_at(0)
    current_homework.status = 'done'
    puts "Student #{surname}: I have done my homework #{current_homework.title}"
    @homeworks << current_homework
    notify(current_homework)
  end
end
