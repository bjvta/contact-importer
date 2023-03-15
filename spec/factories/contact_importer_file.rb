FactoryBot.define do
  factory :contact_importer_file do
    file_name { Faker::Name.name }
    status { 0 }
    log { 'this is the log' }
    user
  end
end