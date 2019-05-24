styles = [
  'men: active',
  'men: business',

  'women: active',
  'women: business',
  'women: designer',
  'women: sexy',
  'women: trendy',
  'women: vintage',
]

styles.each do |style|
  Style.find_or_create_by(name: style)
end
