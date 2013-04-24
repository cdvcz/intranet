json.set! :meta do
  json.total_pages @resources.total_pages
  json.total_entries @resources.total_entries
end

json.set! :content do
  json.array!(@resources) do |json, resource|
    json.(resource, *resource.attributes.keys.map(&:to_sym))
  end
end

