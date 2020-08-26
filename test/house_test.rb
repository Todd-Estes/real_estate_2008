require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end


  def test_it_adds_rooms
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house = House.new("$400000", "123 sugar lane")

    house.add_room(room_1)

    assert_equal 1, house.rooms.length

    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    

    assert_equal 4, house.rooms.length
  end

  def test_price_under_500000_is_below_market_average
    house = House.new("$400000", "123 sugar lane")
    assert_equal false, house.above_market_average?

    house = House.new("$600000", "123 sugar lane")
    assert_equal true, house.above_market_average?
  end

  def test_details_is_a_hash
    house = House.new("$400000", "123 sugar lane")
    #I had some trouble with the brackets, here
    assert_equal [{"price" => 400000, "address" => "123 sugar lane"}], house.details
  end

end
