style_map = [
	'women: trendy',
  'women: business',
  'women: active',
  'women: sexy',
  'women: vintage',
  'women: designer',
  'men: business',
  'men: active'
]

style_map.each do |style|
  Style.create(name: style)
end

