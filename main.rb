require 'json'

read_file = File.read("#{__dir__}/elements.json", encoding: 'utf-8')
elements = JSON.parse(read_file, symbolize_names: true)

puts 'Имеется в наличии вот такие элементы, о каком хотите узнать?'
puts elements.keys.join(', ')

user_input = STDIN.gets.chomp.capitalize.to_sym
selected_item = elements[user_input]

output_message =
  if selected_item
    <<~INFO
      Порядковый номер: #{selected_item[:number]}
      Название: #{selected_item[:name]}
      Первооткрыватель элемента: #{selected_item[:discoverer]}
      Плотность: #{selected_item[:density]} г/см³
    INFO
  else
    'Извините такого нету'
  end

puts output_message
