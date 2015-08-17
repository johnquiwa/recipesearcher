@ingredient = Array.new
@food = {
	:grilled_chicken => {
		:food => "Grilled Chicken",
		:ingredients => ["black pepper", "chicken",  "olive oil"]
	},
	:burgers => {
		:food => "Burgers",
		:ingredients => ["black pepper", "ground beef"]
	}
}


def get_ingredients
	puts "What ingredients do you have? (Input one at a time)"
	@ingredient << gets.chomp
	print "Your ingredients are #{@ingredient}\n"
	puts "Thanks! Anything else? (y/n)"
	@yn = gets.chomp
	if @yn == "y"
		get_ingredients
	elsif @yn == "n"
		@items = @ingredient.sort_by{ |word| word.downcase }
		input_ingredients
	else
		puts "Please answer (y/n)"
		get_ingredients
	end
	if @found == true
		puts "Get to cooking!"
	elsif @found == false
		puts "We don't have anything with that combination of ingredients!"
	end
	menu
end

def input_ingredients
		@food.each do |food, details|
			if @items == details[:ingredients]
				puts ""
				puts ""
				puts ""
				puts "You can make: "
				puts details[:food]
				puts ""
				puts ""
				puts ""
			end
		end
end


def add_recipes
	print "Enter food name: "
	new_food = gets.chomp
	new_food_symbol = new_food.to_sym
	sub = {}
	sub[:food] = new_food
	sub[:ingredients] = Array.new
	puts "What are the ingredients?"
	sub[:ingredients] << gets.chomp
	puts "Thanks! Anything else? (y/n)"
	@yn = gets.chomp
	until @yn == "n"
		puts "What are the ingredients?"
		sub[:ingredients] << gets.chomp
		puts "Thanks! Anything else? (y/n)"
		@yn = gets.chomp
	end
	@food[new_food_symbol] = sub
	menu
end

def list_all_items
	@food.each do |food, details|
		puts "-------"
		puts ""
		puts ""
		puts details[:food]
		puts ""
		puts "Ingredients:"
		puts details[:ingredients]
		puts ""
		puts ""
	end
	menu
end

def menu 
	puts "Hey fuckboi #{@name}"
	puts "What would you like to do?"
	puts "(1) Find Recipe"
	puts "(2) Add Recipe"
	puts "(3) All recipes"
	puts "(4) Quit"
	@do_this = gets.chomp.to_i
	if @do_this == 1
		@ingredient = Array.new
		get_ingredients
	elsif @do_this == 2
		add_recipes
	elsif @do_this == 3
		list_all_items
	elsif @do_this == 4
	end
end
	puts "What is your name?"
	@name = gets.chomp
	menu
	
