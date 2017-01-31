FactoryGirl.define do
  factory :item do
    name "backpack"
    image 'http://www.ems.com/on/demandware.static/-/Sites-vestis-master-catalog/default/dw2a97733b/product/images/1305/102/1305102/1305102_306_main.jpg'
    size "S"
    zip_code "02116"
    body 'Great for a day-trip'
    user
  end
end
