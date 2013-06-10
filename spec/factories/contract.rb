# encoding: utf-8
# author: mbach

FactoryGirl.define() do
  factory(:contract) do
    status('1')

    sequence(:subject) do |subject|
      "Smlouva #{subject}"
    end

    description('Popis ke smlouvě')
  end
end