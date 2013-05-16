json.set! :content do
  json.(@employee, *@employee.attributes.keys.map(&:to_sym))
  json.person @employee.person.attributes
end
