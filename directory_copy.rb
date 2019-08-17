# Exercises:
# 1. Added each_with_index to print method, to print number before name.
# 2. Print only the students whose name begins with a specific letter.
def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_all(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

# Print only the students whose name begins with a specific letter:
def print_starts_with_letter(students)
  puts "Please type a letter to print the students whose names begin with that letter"
  letter = gets.chomp.downcase
  students.each_with_index do |student, index|
    if student[:name][0].downcase == letter
      puts "These students' names begin with the letter #{letter}:"
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
      puts "There are no students whose names begin with #{letter}."
    end
  end
end

students = input_students

# Nothing happens until we call the methods
print_header
print_all(students)
print_footer(students)
print_starts_with_letter(students)
