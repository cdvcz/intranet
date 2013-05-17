json.(resource, *resource.attributes.keys.map(&:to_sym))
  resource.class.reflect_on_all_associations(:belongs_to).each do |association|
  json.set! association.name, resource.send(association.name).attributes
end
