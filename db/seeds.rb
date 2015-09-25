styles = [
  'women: trendy',
  'women: business',
  'women: active',
  'women: sexy',
  'women: vintage',
  'women: designer',
  'men: business',
  'men: active'
]

styles.each do |style|
  Style.create(name: style)
end

