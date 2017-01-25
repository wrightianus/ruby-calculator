def welcome
  puts '------------------------------'
  puts 'Welcome to the Ruby Calculator'
  puts '------------------------------'
end

def initial_calculation 
  first_num = get_first_num
  operator = get_operator
  second_num = get_second_num
  result = operate(first_num, operator, second_num)
  puts "#{first_num} #{operator} #{second_num} = #{result}"
  sequential_calculation(result)
end

def sequential_calculation(first_num)
  operator = get_operator
  second_num = get_second_num
  result = operate(first_num, operator, second_num)
  puts "#{first_num} #{operator} #{second_num} = #{result}"
  sequential_calculation(result)
end

def get_first_num
  print "What is the first Number? "
  valid_number_filter(gets.chomp)
end

def get_operator
print "What is the operator? "
  operator = gets.strip
  initial_calculation if operator == "clear"
  unless ['+', '-', '*', '/'].include?(operator)
    puts "Incorrect Operator: Only + - / * are supported."
    initial_calculation
  end
  operator
end

def get_second_num
  print "What is the second Number? "
  valid_number_filter(gets.chomp)
end

def operate(num1, operator, num2)
  case operator
    when "+"
      return num1 + num2
    when "-"
      return num1 - num2
    when "*"
      return num1 * num2
    when "/"
      if num2 = 0
        puts "Undefined"
        initial_calculation
      else
        return num1 / num2
      end
  end
end

def valid_number_filter(input)
  initial_calculation if input == "clear"
  if input == "0" || input.to_i != 0 
    return input.to_i
  else
    puts "Not A Number"
    initial_calculation
  end
end

welcome
initial_calculation