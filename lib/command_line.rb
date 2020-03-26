class CommandLineInterface 


def drawing
puts"                                  /\                                        "
puts"                              /\  //\\                                      "
puts"                       /\    /\\///\        /\                           " 
puts"                       //\\  /\//\\\\  /\  //\\                         "
puts"          /\          /  ^ \/^ ^/^  ^  ^ \/^ \/  ^ \                        "
puts"         / ^\    /\  / ^   /  ^/ ^ ^ ^   ^\ ^/  ^^  \                        "
puts"        /^   \  / ^\/ ^ ^   ^ / ^  ^    ^  \/ ^   ^  \                  "
puts"       /  ^ ^ \/^  ^\ ^ ^ ^   ^  ^   ^   ____  ^   ^  \       *              "
puts"      / ^ ^  ^ \ ^  _\___________________|  |_____^ ^  \     ||           "
puts"     / ^^  ^ ^ ^\  /_______EASY RESERVATION_______\ ^   \   ||||            "
puts"    /  ^  ^^ ^ ^  /________________________________\  ^  ||||||           "        
puts"   /^ ^  ^ ^^  ^    ||___|___||||||||||||___|__|||     ||||||||          "
puts"  / ^   ^   ^    ^  ||___|___||||||||||||___|__|||        | |             "
puts" / ^ ^ ^  ^  ^  ^   ||||||||||||||||||||||||||||||oooooooo| |ooooooo      "
puts" ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo      "
end

def greet
   puts  "============================="
   puts "||Welcome To Easy Reservation||" 
end 

def get_name
   puts "||  Please Enter Your Name   ||"
   puts "============================="
   @name_insert = gets.chomp.capitalize
end

def get_age
   puts "Welcome #{@name_insert}! Please enter your age."
   @set_age = gets.chomp.to_i

end

def user_name
   User.find_or_create_by(name: @name_insert, age: @set_age)
end 

def age_permit 
   if @set_age >= 21 
      puts "Thank you for choosing Easy Reservation!"
      choices
   else 
      exit
   end
end

def exit 
   puts "***You cannot travel alone if you are under the age of 21.***"
end 

def choices
   prompt = TTY::Prompt.new(symbols:{marker:"✈️"})
   pick = prompt.select("Choose next option") do |option|
      option.choice "Create Reservation" 
      option.choice "View Confirmation"
      option.choice "Change Check-In & Check-Out Date"
      option.choice "Change Location" 
      option.choice "Cancel Reservation"
      option.choice "Exit Easy Reservation"
   end 
   # selection = prompt.select("You have selected", choices)
     if pick == "Create Reservation"
      puts "Check-in YYYY/MM/DD:"
      @check_in = gets.chomp
      puts "Check-out YYYY/MM/DD:"
      @check_out = gets.chomp
      puts "Going to:"
      @location = gets.chomp
      #Reservation.find_or_create_by(user_id: user.id, hotel_id: hotel.id, check_in: check_in, check_out: check_out, location: location) 
      puts "Please Select Which Hotel You Would Like To Stay At:"
      prompt = TTY::Prompt.new(symbols:{marker:"✈️"})
      @select_hotel = prompt.select("Hotel List") do |hotel|
         hotel.choice "Wyndham Hotel Group"
         hotel.choice "Marriott International"
         hotel.choice "Hilton Hotels"
         hotel.choice "Starwood Hotels & Resorts"
      end
          @price = rand(200...2000)
          puts "Staying at #{@select_hotel} will cost a total of $#{@price}."
          confirmation_check = prompt.yes?("PLEASE PRESS ENTER TO CONFIRM")
           if confirmation_check == true 
            puts "Confirmation check"
            hotel = Hotel.find_by(name: @select_hotel)
           reservation = Reservation.create(user_id: user_name.id, hotel_id: hotel.id, check_in: @check_in, check_out: @check_out, location: @location)
            puts "Reservation Confirmed"
            choices
            # p Reservation.all.last
           end
           
   elsif
      pick == "View Confirmation"
      view_confirmation
   elsif 
      pick == "Change Check-In & Check-Out Date"
        change_dates 
   elsif
      pick == "Change Location"
      change_location(reservation)
   elsif
      pick == "Cancel Reservation"
      cancel_reservation
   else   
      pick == "Exit Easy Reservation"
      exit_app
   end
end

def view_confirmation
   puts "Your stay for #{@location} has been confirmed." 
   puts "You will be staying at #{@select_hotel}."
   puts "Your check-in date will be #{@check_in}." 
   puts "Your check-out date will be #{@check_out}." 
   puts "The total of this trip will be $#{@price}." 
   choices
end

def change_location(reservation)
   puts "Where would you like to go?"
   new_location = gets.chomp
   @location = new_location
   puts "Your updated location is now #{new_location}."
   choices 
end

def change_dates
   puts "Please Enter New Check-In Date."
   new_date = gets.chomp
   @check_in = new_date 
   puts "Please Enter New Check-Out Date."
   new_out = gets.chomp
   @check_out = new_out 
   puts "Your new check-in date will be #{@check_in}."
   puts "Your new check-out date will be #{@check_out}."
   choices 
end 


def cancel_reservation
   Reservation.all.map {|reservation| reservation.delete}
   puts "Your reservation has been cancelled."
   exit_app
end

def exit_app
   puts "💼=======================================💼"
   puts "💼Thank you for choosing Easy Reservation💼"
   puts "💼=======================================💼"
end 


end    