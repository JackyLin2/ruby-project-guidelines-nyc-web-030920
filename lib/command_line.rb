class CommandLineInterface 

def greet
   puts "Welcome to Easy Reservation" 
end

# def name_greet 
#    # name_insert = gets.chomp.capitalize
#    # puts "Welcome #{name_insert}, please enter your age."
#    # @set_age = gets.chomp.to_i
#    # user_create(name_insert, @set_age)
# end

def get_name
   puts "Please enter your name"
   @name_insert = gets.chomp.capitalize
end

def get_age
   puts "Welcome #{@name_insert}, please enter your age."
   @set_age = gets.chomp.to_i

end

def user_name
   User.find_or_create_by(name: @name_insert, age: @set_age)
end 




# def create_reservation(user, hotel, check_in, check_out, location)
#    res_user = User.find_or_create_by(name: user)  #name_greet
#    res_hotel = Hotel.find_or_create_by(name:hotel)
#    Reservation.find_or_create_by(user_id: res_user.id, hotel_id: res_hotel.id, check_in: check_in, check_out: check_out, location: location)
# end

def age_permit 
   if @set_age >= 21 
      puts "Thank you for choosing Easy Reservation."
      choices
   else 
      exit
   end
end

def exit 
   puts "You cannot travel alone if you are under 21."
end 

def choices
   prompt = TTY::Prompt.new
   pick = prompt.select("Choose next option") do |option|
      option.choice "Create Reservation" 
      option.choice "View Confirmation"
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
      puts "Please select wich Hotel you would like to stay at"
      prompt = TTY::Prompt.new 
      @select_hotel = prompt.select("Hotel List") do |hotel|
         hotel.choice "Wyndham Hotel Group"
         hotel.choice "Marriott International"
         hotel.choice "Hilton Hotels"
         hotel.choice "Starwood Hotels & Resorts"
      end
          price = rand(200...2000)
          puts "Staying at #{@select_hotel} will cost a total of $#{price}"
          confirmation_check = prompt.yes?("Do you want to confirm?")
           if confirmation_check == true 
            puts "Confirmation check"
            hotel = Hotel.find_by(name: @select_hotel)
           reservation= Reservation.create(user_id: user_name.id, hotel_id: hotel.id, check_in: @check_in, check_out: @check_out, location: @location)
            puts "Reservation Confirmed"
            choices
            # p Reservation.all.last
           end
           
   elsif
      pick == "View Confirmation"
      view_confirmation
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
   puts "Your stay for #{@location} has been confirmed. Your check-in date is at #{@check_in} and your check-out date is at #{@check_out} "
   choices
end

def change_location(reservation)
   puts "Where would you like to go?"
   new_location = gets.chomp
   @location = new_location
   puts "Your updated location is now #{new_location}"
   choices 
end

def cancel_reservation
   Reservation.last.delete 
   puts "Your reservation has been cancelled."
end

def exit_app
   puts "Thank you for choosing Easy Reservation."
end 







end    