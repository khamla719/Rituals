json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :url, :direction, :story
  json.url recipe_url(recipe, format: :json)
end
