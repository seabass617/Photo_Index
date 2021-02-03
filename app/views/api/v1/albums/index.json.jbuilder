json.array! @albums do |album|
  json.extract! album, :id, :name, :description, :index
end