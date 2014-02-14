FactoryGirl.define do
  factory :post do
    title "The title"
    published true
    factory :post_with_tags, class: Post do
      tag
    end
    factory :unpublished_post do
      published false
    end
  end
end
