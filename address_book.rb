require "./contact"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
	end

	def print_results(search, results)
		puts search   
		results.each do |contact|
                puts contact.to_s('full_name')
                contact.print_phone_numbers
                contact.print_addresses
                puts "\n"
                end
	end

	def find_by_name(name)
		results = []
		search = name.downcase
		contacts.each do |contact|
			if contact.full_name.downcase.include?(search)
			results.push(contact)
		end
	end

	print_results("Name seach results (#{search})", results)
		
	end



        def find_by_phone_number(number)
                results = []
                search = number.gsub("-", "")
                contacts.each do |contact|
                        contact.phone_numbers.each do |phone_number|
			if phone_number.number.gsub("-", "").include?(search)
                        results.push(contact) unless results.include?(contact)
			end
               	end
	end

        print_results("Phone seach results (#{search})", results)

        end

        def find_by_address(query)
                results = []
                search = query.downcase
	        contacts.each do |contact|
                        contact.addresses.each do |address|
				if address.to_s('long').downcase.include?(search)
					results.push(contact) unless results.include?(contact)
                        end
                end
        end

        print_results("Address seach results (#{search})", results)

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

#address_book.print_contact_list 

#address_book.find_by_name("jack")

#address_book.find_by_phone_number("646")

address_book.find_by_address("123")
