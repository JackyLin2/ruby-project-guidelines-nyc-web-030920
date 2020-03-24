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
   puts "You cannot travel alone if you are under 21"
end 

def choices
   prompt = TTY::Prompt.new
   choices = prompt.select("Chose next option") do |option|
      option.choice "Create Reservation" 
      option.choice "View Confirmation"
      option.choice "Change Date" 
      option.choice "Cancel Reservation"
   end 
   selection = prompt.select("You have selected", choices)
     if selection == "Create Reservation"
      puts "Check-in YYYYMMDD:"
      check_in = gets.chomp
      puts "Check-out YYYYMMDD:"
      check_out = gets.chomp
      puts "Going to:"
      location = gets.chomp

      #Reservation.find_or_create_by(user_id: user.id, hotel_id: hotel.id, check_in: check_in, check_out: check_out, location: location) 
      puts "Please select wich Hotel you would like to stay at"
      prompt = TTY::Prompt.new 
      select_hotel = prompt.select("Hotel List") do |hotel|
         hotel.choice "Wyndham Hotel Group"
         hotel.choice "Marriott International"
         hotel.choice "Hilton Hotels"
         hotel.choice "Starwood Hotels & Resorts"
      end
          price = rand(200...2000)
          puts "Staying at #{select_hotel} will cost a total of $#{price}"
          confirmation_check = prompt.yes?("Do you want to confirm?")
           if confirmation_check == true 
            puts "Confirmation check"
            hotel = Hotel.find_by(name: select_hotel)
            Reservation.create(user_id: user_name.id, hotel_id: hotel.id, check_in: check_in, check_out: check_out, location: location)
            puts "Reservation Confirmed"
            p Reservation.all.last
           end
   elsif
      selection == "View Confirmation"
      view_confirmation
   elsif
      selection == "Change Date"
      change_date
   end
end

def view_confirmation
   puts "You are confirmed for "
end

def change_date(reservation)
   new_date=gets.chomp
   reservation.check_in = new_date 
puts "We have changed"

end










end    