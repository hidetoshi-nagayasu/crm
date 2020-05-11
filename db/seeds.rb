# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'net/http'
require 'json'
require 'date'

data_num = 50
uri = "https://green.adam.ne.jp/roomazi/cgi-bin/randomname.cgi?n=#{data_num}"

uri = URI.parse(uri)
res = Net::HTTP.start(uri.host, uri.port, use_ssl: true){|https|
  req = Net::HTTP::Get.new(uri)
  https.request(req)
}
res.body.gsub!(/^.*callback\(/, '')
res.body.gsub!(/\)/, '')

names = JSON.parse(res.body)['name']

 names.each_with_index do |name, i|
  kanji_array = name[0].split
  en_array = name[2].split
  email = en_array[1].downcase + '.' + en_array[0].downcase + '@example.com'

  Customer.create({ last_name: kanji_array[0], first_name: kanji_array[1], age: rand(20..50), email: email, created_by: 1, updated_at: Time.now })
end
