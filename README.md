# Airplane booking system

Badi flight company needs to add a booking system to the current application.

Currently the Badi fleet is composed only by a short range plane that has the following characteristics:

| Aircraft Type | Sits Count  | Rows        | Row Arrangement          |
|---------------|-------------|-------------|--------------------------|
| :short_range  | 156         | 26          | A B C _ D E F            |


The service:

- Doesn't have any database support.
- Should be designed to expose an interface that allows separate components to interact with it

Interface example

```ruby
# Book a seat position for the given user
#
# Example:
#   /> booking.book('B15', 'Marco')
#   => true
#
#  @params [String] seat_position
#  @params [String] passenger_name
#  @return [Boolean]
booking.book(seat_position, passenger_name)

# Check if a seat position is booked
#
# Example:
#   /> booking.booked?('B15')
#   => true
#
#  @params [String] seat_position
#  @return [Boolean]
booking.booked?(seat_position)

# Return the name of the user that booked the given seat
#
# Example:
#   /> booking.seat('B15')
#   => Marco
#
#  @params [String] seat_position
#  @return [Boolean]
booking.seat(seat_position)

# Cancel the booking for the given seat
#
# Example:
#   /> booking.seat('B15')
#   => Marco
#
#  @params [String] seat_position
#  @return [Boolean]
booking.unbook!(seat_position)
# true

# Show the plane status printing in console the grid of the seats printing `0`
# for empty seats and `X` for booked. The aisle will be showed with the `_`
# symbol.
# It should return an Array where each element is a raw like shown in console.
#
# Example:
#   /> booking.show
#      /-----------\
#      0 0 X _ 0 0 0
#      0 X X _ 0 0 0
#      0 0 0 _ X 0 0
#      0 0 0 _ 0 0 0
#      ...
#      \-----------/
#   => nil
#
#  @params [String] seat_position
#  @return Array
booking.show
```

We want to enhance the user experience allowing the user to make a multiple places booking and have the places booked nearby. The API to support the multiple places booking will accept the number of plcaes to book (up to 8 and) and the name of the user, then it will return the position of the places booked.
The logic to booke the place nearby follows this rules:

1) if the places can all fit inside a lane, they will be booked in the same row:
ex.
```ruby
  booking.book_multiple("marco", 3)

  # X X X _ 0 0 0
  # 0 0 0 _ 0 0 0
```

2) if the places don't fit inside a lane, they will be balance across rows:
ex.
```ruby
  booking.book_multiple("marco", 4)

  # 0 X X _ 0 0 0
  # 0 X X _ 0 0 0
```

3) if the pane is full and they cannot be balanced across rows, they will booked across the aisle:
ex.
```ruby
  booking.book_multiple("marco", 4)

  # 0 0 X _ X 0 0
  # 0 0 X _ X 0 0
```

The API interface is

```ruby
# Check if a seat position is booked
#
# Example:
#   /> booking.book_multiple('marco', 4)
#   => ['A3', 'A4', 'B3', 'B4']
#
#  @params [String] passenger_name
#  @params [Integer] number_of_booking (from 1 to 8)
#  @return [Boolean]

booking.book_multiple(passenger_name, number_of_booking)
```

You should:

- Add information about your design decision.
- Write production-ready code.
- Design the code in order to be extensible.
- Suggest possible enhancements
- Provide the source code with all the git history and the description about how to execute the code.
