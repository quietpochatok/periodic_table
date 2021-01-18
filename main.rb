if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'json'

read_file = File.read("#{__dir__}/elements.json", encoding: 'utf-8')
parse_file = JSON.parse(read_file, symbolize_names: true)

puts 'Имеется в наличии вот такие элементы, о каком хотите узнать?'
puts parse_file.keys.join(', ')

user_input = STDIN.gets.chomp.capitalize.to_sym
selected_item = parse_file[user_input]

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