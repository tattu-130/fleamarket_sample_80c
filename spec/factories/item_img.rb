FactoryBot.define do
  factory :item_img do
    src { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/sample.png"), 'image/png') }
  end
end