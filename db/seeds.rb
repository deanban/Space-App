# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2017-10-2&api_key=NeEtcC0syMD5oQJF0bt49STyJamoSj4E5sv0Axui'
response = JSON.parse(RestClient.get(url))

def clean_data(photo)

	obj = {}
	obj["photo_id"] = photo["id"]
	obj["cam_name"] = photo["camera"]["name"]
	obj["img_src"] = photo["img_src"]
	obj["earth_date"] = photo["earth_date"]

	obj
end

response["photos"].each do |photo|
	newData = clean_data(photo)
	Curiosity.create(newData)
end
