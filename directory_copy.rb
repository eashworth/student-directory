# 1. Added each_with_index to print method, to print number before name.
# 2. Print only the students whose name begins with a specific letter.
# 3. Print only the students whose name is shorter than 12 characters.
# 4. Rewrite the each() method that prints all students using while or until control flow methods (Loops).
# 5. Add more information for each student: hobbies, country of birth, height, etc.
#    This looks like it should be combined with exercise 7.
# 7. In the input_students method the cohort value is hard-coded.
#    How can you ask for both the name and the cohort?
#    What if one of the values is empty? Can you supply a default value?
#    The input will be given to you as a string. How will you convert it to a symbol?
#    What if the user makes a typo?

# Confirm_input allows correction of typos.
# If no input is desired (so that a default value is automatically assigned later),
# the user must hit enter twice the FIRST time input is requested.
# Once input has been given, giving "empty" input will confirm the input already given.

def confirm_input(variable, input)
  while !(input.empty?) do
    puts "You typed #{variable}."
    puts "If you are happy with your input, type enter. Otherwise, type your input again."
    input = gets.chomp
    if input.empty?
    else
      variable = input
    end
  end
  variable
end
def input_students
  puts "Please enter the name of a student, or type stop to finish."
  students = []
  name = gets.chomp
  input = name
  name = confirm_input(name, input)

  while !(name == "stop") do
    name = "name unknown" if name.empty?
    puts "Please enter the cohort of that student."
    cohort = gets.chomp
    input = cohort
    cohort = confirm_input(cohort, input)
    cohort = "unknown" if cohort.empty?
    puts "Please enter that student's country of birth"
    country_of_birth = gets.chomp
    input = country_of_birth
    country_of_birth = confirm_input(country_of_birth, input)
    country_of_birth = "unknown" if country_of_birth.empty?
    puts "Please enter the hobbies of that student, separated by a comma and a space"
    hobbies = gets.chomp
    input = hobbies
    hobbies = confirm_input(hobbies, input)
    hobbies = "unknown" if hobbies.empty?
    puts "Please enter the height of that student"
    height = gets.chomp
    input = height
    height = confirm_input(height, input)
    height = "unknown" if height.empty?
    students << {
      name: name.to_sym,
      cohort: cohort.to_sym,
      country_of_birth: country_of_birth.to_sym,
      hobbies: hobbies.to_sym,
      height: height.to_sym
    }
    puts "Now we have #{students.count} students - add another or type 'stop'"
    name = gets.chomp
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Rewrite the each() method that prints all students using while or until control flow methods (Loops).
def print_all(students)
  counter = 0
  while true do
    puts "#{(counter + 1)}. #{students[counter][:name]} "\
         "(#{students[counter][:cohort]} cohort, "\
         "country of birth: #{students[counter][:country_of_birth]}, "\
         "hobbies: #{students[counter][:hobbies]}, "\
         "height: #{students[counter][:height]})"
    counter += 1
    break if counter == students.length
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
      puts "#{index + 1}. #{students[index][:name]} "\
           "(#{students[index][:cohort]} cohort, "\
           "country of birth: #{students[index][:country_of_birth]}, "\
           "hobbies: #{students[index][:hobbies]}, "\
           "height: #{students[index][:height]})"
    end
  end
end

# Print only the students whose name is shorter than 12 characters:
def print_names_of_length_less_than_n(students)
  puts "To print students whose names are shorter than a certain length, please type a number."
  name_length = gets.chomp.downcase.to_i
  students.each_with_index do |student, index|
    if student[:name].length < name_length
      puts "#{index + 1}. #{students[index][:name]} "\
           "(#{students[index][:cohort]} cohort, "\
           "country of birth: #{students[index][:country_of_birth]}, "\
           "hobbies: #{students[index][:hobbies]}, "\
           "height: #{students[index][:height]})"
    end
  end
end

students = input_students

# Nothing happens until we call the methods
# print_header
print_all(students)
# print_footer(students)
# print_starts_with_letter(students)
# print_names_of_length_less_than_n(students)
