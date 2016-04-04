json.array!(@recipes) do |memory|
  json.extract! memory, :id, :title, :url, :direction, :story
  json.url memory_url(memory, format: :json)
end
