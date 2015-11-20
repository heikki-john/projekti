json.array!(@favorite_numbers) do |favorite_number|
  json.extract! favorite_number, :id, :user_id, :num1, :num2, :num3, :num4, :num5, :num6, :num7
  json.url favorite_number_url(favorite_number, format: :json)
end
