json.array!(@codes) do |code|
  json.extract! code, :id, :titulo, :codigo
  json.url code_url(code, format: :json)
end
