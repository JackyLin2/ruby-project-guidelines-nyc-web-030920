require_relative '../config/environment'

cli = CommandLineInterface.new

cli.greet 
cli.get_name
cli.get_age
# cli.user_create(name,)
#user = cli.name_greet 
cli.age_permit
cli.user_name

cli.choices
