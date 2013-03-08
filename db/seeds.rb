# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category_list = ['Авторынок',
'Анонсы (Новости)',
'Аудио, видео, фототехника',
'Бытовая техника',
'Животные',
'Знакомство',
'Компьютеры',
'Мебель',
'Недвижимость',
'Одежда и обувь',
'Продукты питания',
'Промышленные товары',
'Работа',
'Разное',
'Спорт, туризм, отдых',
'Средства связи',
'Строительство, ремонт, отделка',
'Услуги']

category_list.each do |name|
	Category.create( name: name )
end