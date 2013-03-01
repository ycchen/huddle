# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status_report do
    project nil
    user nil
    yesterday "MyText"
    today "MyText"
    status_date "2013-02-27"
    invoke "MyString"
    rspec "MyString"
  end
end
