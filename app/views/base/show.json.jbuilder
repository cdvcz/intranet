json.set! :content do
  render partial: 'base/resource', locals: { json: json, resource: resource }
end
