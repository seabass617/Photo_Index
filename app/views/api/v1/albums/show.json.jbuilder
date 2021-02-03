json.extract! @album, :id, :name, :description, :index
json.photos @album.photos do |photo|
  json.extract! photo, :id, :description, :index
end