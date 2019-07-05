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

You should:

- Add information about your design decision.
- Write production-ready code.
- Design the code in order to be extensible.
- Suggest possible enhancements
- Provide the source code with all the git history and the description about how to execute the code.
