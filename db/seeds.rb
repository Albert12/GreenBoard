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

i = 3
INPUT_FILENAME  = Rails.root.join("db/r_reflex.txt")
BLOCK_SIZE = 400
domain = ['.ru', '.com', '.org', '.net', '.gov']
service = ['@mail', '@google', '@yahoo', '@yandex']
File.open(INPUT_FILENAME) { |f|
  while i != 0
  	content = f.read(BLOCK_SIZE)
  	email = SecureRandom.hex(4) + service.sample + domain.sample
	phone = rand((1000000..99999999999)).to_s
	icq = rand((1000000..99999999999)).to_s
	skype  = SecureRandom.hex(4)
	name = ('a'..'z').to_a.shuffle[0..(7..11).to_a.sample].join.capitalize
	Advert.create( content: content, email: email, phone: phone, icq: icq, skype: skype, name: name,
		category_id: rand((1..category_list.length)) )
	i -= 1
  end
}
