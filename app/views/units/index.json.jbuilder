json.set! :content do
  json.array!(@resources) do |json, unit|
    json.(unit, :id, :name, :abbreviation, :parent_id)
  end
end
