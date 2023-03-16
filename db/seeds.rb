# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.any?
  user_one = User.create(username: 'user1', password: 'adminadmin', email: 'user_one@yopmail.com')
  user_two = User.create(username: 'user2', password: 'qwertyqwerty', email: 'user_two@yopmail.com')

  contact_importer_file = ContactImporterFile.create(user: user_one, file_name: 'test1.csv',
                                                     log: 'Created in the setting up.')
  contact_one = Contact.create(name: 'Pedro Perez',
                               birthday: '19900131',
                               phone: '(+57) 320-432-05-09',
                               address: 'This is the address',
                               credit_card_number: '8723894237rhajkdhfas8bkasdf',
                               credit_card_network: 'MasterCard',
                               credit_card_last_for_digit: '1234',
                               email: 'pedro@gmail.com',
                               user: user_one,
                               contact_importer_file: contact_importer_file)

  cif = ContactImporterFile.create(user: user_two, file_name: 'test1.csv', log: 'Created in the setting up.')
  100.times do
    contact = Contact.create(
      name: Faker::Name.name,
      birthday: Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%F'),
      phone: '(+57) 320-432-05-09',
      address: Faker::Address.full_address,
      credit_card_number: '12312342353563456456',
      credit_card_last_for_digit: Faker::Finance.credit_card.last(4),
      credit_card_network: ['American Express', 'Diners Club', 'Discover', 'JCB', 'MasterCard', 'Visa'].sample,
      email: Faker::Internet.email,
      user: user_two,
      contact_importer_file: cif
    )
    contact
  end
end
