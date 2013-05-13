# author: martinbachtikcdvcz

FactoryGirl.define do

  factory :datafile do
    status "1"
    sequence(:name) {|i| "Soubor #{i}" }
    description "Popis k souboru"
    sequence(:data_file_name) {|i| "soubor#{i}.pdf" }
    data_file_size 1024
    data_content_type "text/pdf"
  end

end