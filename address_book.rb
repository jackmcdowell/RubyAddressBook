require "./contact"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
	end

	def print_contact_list
		puts "Contact List"
		contacts.each do |contact|
		puts contact.to_s('last_first')
		end
	end
end

address_book = AddressBook.new

jack = Contact.new
jack.first_name = "Jack"
jack.last_name = "McDowell"
jack.add_phone_number("Home","646-642-XXXX")
jack.add_address("Home", "123 Home St.", "", "Portland", "OR", "12345")

brooke = Contact.new
brooke.first_name = "Brooke"
brooke.last_name = "McDowell"
brooke.add_phone_number("Home","646-642-XXXX")
brooke.add_address("Home", "123 Home St.", "", "Portland", "OR", "12345")

address_book.contacts.push(jack)
address_book.contacts.push(brooke)

address_book.print_contact_list 

