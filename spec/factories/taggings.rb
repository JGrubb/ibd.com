# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagging, :class => 'Tagging' do
    post_id 1
    tag_id 1
    info "MyText"
  end
end
