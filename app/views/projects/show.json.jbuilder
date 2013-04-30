json.set! :content do
  json.(
    @project,
    :id,
    :status,
    :number,
    :name,
    :name_en,
    :acronym,
    :date_from,
    :date_to
  )
end
