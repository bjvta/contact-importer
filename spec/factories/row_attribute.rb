FactoryBot.define do
  factory :row_attribute do
    attr_type { 'name' }
    val { 'Brandon Jason' }
    row_importer
  end
end
