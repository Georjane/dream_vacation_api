class HotelRepresenter
  def initialize(hotel)
    @hotel = hotel
  end
  def as_json
    { id: hotel.id,
      title: hotel.title,
      description: hotel.description,
      image_url: hotel.image_url,
    }
  end
  private
  attr_reader :hotel
end
