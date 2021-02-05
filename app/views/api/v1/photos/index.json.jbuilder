json.photos @album.photos do |photo|
  json.extract! photo, :id, :description, :index
end
