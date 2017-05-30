FactoryGirl.define do
    factory :article do
        title "This is title"
        text "This is text"
        initialize_with { Articles.find_or_create_by_title(title)}
    end
end
