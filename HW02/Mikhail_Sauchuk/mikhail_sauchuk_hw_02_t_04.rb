# An arbitrary string is given, the method `task_4` 
# must return the count of letters and digits in that string.

def count_letters(str)
  str.scan(/[a-zA-Z]/).size
end

def count_digits(str)
  str.scan(/[0-9]/).size
end

def main(str)
  letters = count_letters(str)
  digits = count_digits(str)
  puts "{letters: #{letters}, digits: #{digits}}"
end

main('hel2!lo')
main('wicked .. !')
