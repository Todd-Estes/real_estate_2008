class House
  attr_reader :price, :address, :rooms
  def initialize(price, address, rooms = [])
    @price = price
    @address = address
    @rooms = rooms
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def above_market_average?
    if (@price.sub('$','').to_i) > 500000
      true
    else
      false
    end
  end

  def area
    areas = 0
    @rooms.each do |room|
    areas += room.area
    areas
    end
  end

  def details
    detail = Hash.new
    detail["price"] = @price
    detail["address"] = @address
    p detail
  end
end
