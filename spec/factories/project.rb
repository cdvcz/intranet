FactoryGirl.define do
  factory :project do
    status "1"
    sequence(:number) {|i| "PR-#{i}" }
    sequence(:name) {|i| "Vyzkumny projekt CDV #{i}" }
    sequence(:name_en) {|i| "TRC Research Project #{i}" }
    sequence(:acronym) {|i| "VPCDV#{i}" }
    date_from { 1.year.ago }
    date_to { 3.year.since }
  end
end