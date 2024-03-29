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
# 6. Research how the method center() of the String class works.
#    Use it in your code to make the output beautifully aligned.
# 8. Once you complete the previous exercise,
#    change the way the users are displayed: print them grouped by cohorts.
#    To do this, you'll need to get a list of all existing cohorts
#    (the map() method may be useful but it's not the only option),
#    iterate over it and only print the students from that cohort.
#    I think this means print all students grouped by cohort
#    (as opposed to just printing one cohort).
# 9. Right now if we have only one student,
#    the user will see a message "Now we have 1 students",
#    whereas it should be "Now we have 1 student".
#    How can you fix it so that it used singular form when appropriate
#    and plural form otherwise?
# 10.We've been using the chomp() method to get rid of the last return character.
#    Find another method among those provided by the String class
#    that could be used for the same purpose
#    (although it will require passing some arguments).

# confirm_input allows correction of typos.
# If no input is desired (so that a default value is automatically assigned later),
# the user must hit enter twice the FIRST time input is requested.
# Once input has been given, giving "empty" input will confirm the input already given.
def confirm_input(variable, input)
  while !(input.empty?) do
    puts "You typed #{variable}."
    puts "If you are happy with your input, type enter. Otherwise, type your input again."
    input = gets.slice(0..-2)
    if input.empty?
    else
      variable = input
    end
  end
  variable
end
def get_cohort
  puts "Please enter the cohort of that student."
  cohort = gets.slice(0..-2)
  input = cohort
  cohort = confirm_input(cohort, input)
  cohort = "unknown" if cohort.empty?
  cohort
end
def get_country_of_birth
  puts "Please enter that student's country of birth"
  country_of_birth = gets.slice(0..-2)
  input = country_of_birth
  country_of_birth = confirm_input(country_of_birth, input)
  country_of_birth = "unknown" if country_of_birth.empty?
  country_of_birth
end
def get_hobbies
  puts "Please enter the hobbies of that student, separated by a comma and a space"
  hobbies = gets.slice(0..-2)
  input = hobbies
  hobbies = confirm_input(hobbies, input)
  hobbies = "unknown" if hobbies.empty?
  hobbies
end
def get_height
  puts "Please enter the height of that student"
  height = gets.slice(0..-2)
  input = height
  height = confirm_input(height, input)
  height = "unknown" if height.empty?
  height
end
def get_name
  puts "Please enter the name of a student, or type stop to finish."
  name = gets.slice(0..-2)
  input = name
  name = confirm_input(name, input)
  name = "name unknown" if name.empty?
  name
end
def input_students
  students = []
  name = get_name
  while !(name == "stop") do
    cohort = get_cohort
    country_of_birth = get_country_of_birth
    hobbies = get_hobbies
    height = get_height
    students << {
      name: name.to_sym,
      cohort: cohort.to_sym,
      country_of_birth: country_of_birth.to_sym,
      hobbies: hobbies.to_sym,
      height: height.to_sym
    }
    if students.count == 1
      puts "Now we have one student - add another or type 'stop'"
    else
      puts "Now we have #{students.count} students - add another or type 'stop'"
    end
    name = get_name
  end
  students
end

def print_header
  width = 120
  puts "The students of Makers Academy".center(width)
  puts "-------------".center(width)
end

def print_all(students)
  width = 120
  counter = 0
  while true do
    puts "#{(counter + 1)}. #{students[counter][:name]} "\
         "(#{students[counter][:cohort]} cohort, "\
         "country of birth: #{students[counter][:country_of_birth]}, "\
         "hobbies: #{students[counter][:hobbies]}, "\
         "height: #{students[counter][:height]})".center(width)
    counter += 1
    break if counter == students.length
  end
end

def print_footer(students)
  width = 120
  if students.count == 1
    puts "Overall, we have one great student.".center(width)
  else
    puts "Overall, we have #{students.count} great students.".center(width)
  end
end

def print_starts_with_letter(students)
  width = 120
  puts "Please type a letter to print the students whose names begin with that letter"
  letter = gets.slice(0..-2).downcase
  students.each_with_index do |student, index|
    if student[:name][0].downcase == letter
      puts "#{index + 1}. #{students[index][:name]} "\
           "(#{students[index][:cohort]} cohort, "\
           "country of birth: #{students[index][:country_of_birth]}, "\
           "hobbies: #{students[index][:hobbies]}, "\
           "height: #{students[index][:height]})".center(width)
    end
  end
end

def print_names_of_length_less_than_n(students)
  width = 120
  puts "To print students whose names are shorter than a certain length, please type a number."
  name_length = gets.slice(0..-2).downcase.to_i
  students.each_with_index do |student, index|
    if student[:name].length < name_length
      puts "#{index + 1}. #{students[index][:name]} "\
           "(#{students[index][:cohort]} cohort, "\
           "country of birth: #{students[index][:country_of_birth]}, "\
           "hobbies: #{students[index][:hobbies]}, "\
           "height: #{students[index][:height]})".center(width)
    end
  end
end

def print_by_cohort(students)
  width = 120
  sorted_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
    sorted_by_cohort[cohort].push(student[:name])
  end
  sorted_by_cohort.each do |cohort, names|
    puts "#{cohort} cohort: #{names.join(", ")}".center(width)
  end
end

students = input_students

print_header
print_all(students)
print_footer(students)
print_starts_with_letter(students)
print_names_of_length_less_than_n(students)
print_by_cohort(students)
