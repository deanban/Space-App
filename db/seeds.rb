# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

dean = User.create({username: "dean", password: "a"})
zali = User.create({username: "zali", password: "a"})
luke = User.create({username: "luke", password: "a"})



url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2017-10-1&api_key=NeEtcC0syMD5oQJF0bt49STyJamoSj4E5sv0Axui'
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

url2 = "https://api.nasa.gov/neo/rest/v1/feed?start_date=2017-09-27&end_date=2017-10-02&api_key=NeEtcC0syMD5oQJF0bt49STyJamoSj4E5sv0Axui"
asteroid_data = JSON.parse(RestClient.get(url2))
arr = asteroid_data["near_earth_objects"]

def clean_asteroid_data(data)

	obj = {}

	obj["name"] = data["name"]
	obj["nasa_jpl_url"] = data["nasa_jpl_url"]
	obj["estimated_diameter_min"] = data["estimated_diameter"]["feet"]["estimated_diameter_min"]
	obj["estimated_diameter_max"] = data["estimated_diameter"]["feet"]["estimated_diameter_max"]
	obj["hazardous"] = data["is_potentially_hazardous_asteroid"]
	obj["close_approach_date"] = data["close_approach_data"][0]["close_approach_date"]
	obj["relative_velocity"] = data["close_approach_data"][0]["relative_velocity"]["miles_per_hour"]
	obj["miss_distance"] = data["close_approach_data"][0]["miss_distance"]["miles"]
	
	obj
end

arr.each do |key, val|
	val.each do |asteroid|
		newData = clean_asteroid_data(asteroid)
		Asteroid.create(newData)
	end
end

luke.curiosities.push(Curiosity.first)
dean.curiosities.push(Curiosity.second)
zali.curiosities.push(Curiosity.third)



