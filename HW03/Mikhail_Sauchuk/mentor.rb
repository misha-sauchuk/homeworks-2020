# mentor recieves homeworks from students
# he checks all homeworks that he recived
# mentor sends back homeworks to the students
# with updated status

require_relative 'abstract_observer'

class MentorMath < AbstractObserver
  def initialize(name, surname)
    super(name, surname)
    @students = []
  end

  def attach(student)
    puts "Mentor #{surname}: subscribes to student #{student.surname}"
    students << student
  end

  def detach(student)
    @students.delete(student)
  end

  def notify
    puts "Mentor #{surname}: Your homework was checked, please see status"
    students.each { |student| student.update(homeworks) }
    homeworks.clear
  end

  def update(student, homework)
    puts "Mentor #{surname}: I recived homework #{homework.title} from" \
           " #{student.surname}"
    @homeworks << homework
  end

  def check_homework
    possible_results = %w[accept accept accept reject]
    homeworks.each { |homework| homework.status = possible_results.sample }
    notify
  end
end
