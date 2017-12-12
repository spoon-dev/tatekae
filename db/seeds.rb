# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# input Locale
locale_attrs = [
  {id: 0, code: "JP"}
]

locale_attrs.each do |attr|
  obj = Locale.find_or_initialize_by(id: attr[:id])
  obj.update_attributes(attr)
end


# input calc
calc_attrs = [
  {id: 0, locale_id: 0, unit: 1},
  {id: 1, locale_id: 0, unit: 10},
  {id: 2, locale_id: 0, unit: 100},
  {id: 3, locale_id: 0, unit: 1000},
]

calc_attrs.each do |attr|
  obj = Calc.find_or_initialize_by(id: attr[:id])
  obj.update_attributes(attr)
end
Rails.cache.delete('Calc')

# input category data
category_attrs = [
  {id: 0, locale_id: 0, order: 0, name: "公共交通機関", icon: "train",             color: "blue"},
  {id: 1, locale_id: 0, order: 1, name: "レンタカー",   icon: "directions_car",    color: "teal"},
  {id: 2, locale_id: 0, order: 2, name: "ガソリン代",   icon: "local_gas_station", color: "green"},
  {id: 3, locale_id: 0, order: 3, name: "高速道路",     icon: "star",              color: "lime"},
  {id: 4, locale_id: 0, order: 4, name: "駐車場",       icon: "local_parking",     color: "purple"},
  {id: 5, locale_id: 0, order: 5, name: "宿泊",         icon: "hotel",             color: "amber"},
  {id: 6, locale_id: 0, order: 6, name: "食事",         icon: "restaurant",        color: "indigo"},
  {id: 7, locale_id: 0, order: 7, name: "買い物",       icon: "shopping_cart",     color: "brown"},
  {id: 8, locale_id: 0, order: 8, name: "観光",         icon: "local_florist",     color: "orange"},
  {id: 9, locale_id: 0, order: 9, name: "その他",       icon: "priority_high",     color: "blue-grey"},
]

category_attrs.each do |attr|
  obj = Category.find_or_initialize_by(id: attr[:id])
  obj.update_attributes(attr)
end
Rails.cache.delete('Category')
