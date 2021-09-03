# app/representers/hotels_representer.rb
class HotelsRepresenter
 def initialize(hotels)
   @hotels = hotels
 end
 
 def as_json
   hotels.map do |hotel|
     {
       id: hotel.id,
       title: hotel.title,
       description: hotel.author,
       image_url: hotel.image_url,
     }
   end
 end
 private
 attr_reader :hotels
end