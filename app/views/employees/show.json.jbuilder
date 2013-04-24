json.set! :content do
  json.(
    @employee,
    :id,
    :number,
    :full_name_with_titles,
    :job,
    :email,
    :phone,
    :phone_cellular,
    :employed_from,
    :employed_to)
end
