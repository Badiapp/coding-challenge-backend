# Airplane booking system

Badi flight company needs to add a booking system to the current application.

Currently the Badi fleet is composed only by a short range plane that has the following characteristics:

| Aircraft Type | Sits Count  | Rows        | Row Arrangement          |
|---------------|-------------|-------------|--------------------------|
| :short_range  | 156         | 26          | A B C _ D E F            |


The service:

- Doesn't have any database support.
- Should be designed to expose an interface that allows separate components to interact with it

The API should support the multiple places booking will accept the number of places to book (up to 8 and) and the name of the user, then it will return the position of the places booked.

The booking logic has the following rules:

1) if the places can all fit inside a lane, they will be booked in the same row
2) if the places don't fit inside a lane, they will be balance across rows
3) if the plane is full and the seats cannot be balanced across rows, they will booked across the aisle
4) The booking should start from the windows seat, when possible.


Here an interface example:
```ruby
booking = Booking.new(plane)

booking.book('Marco', 4)
booking.book('Gerard', 2)

booking.show
```

Given an empty plane, here are some expected behavior for the booking.
```
Bookings: 
  * Marco: 4 people;
  * Gerard: 2 people;
Result: 
  * Marco seats: 'A1', 'B1', 'A2', 'B2'; 
  * Gerard seats: 'D1', 'E1';

Bookings: 
  * Iosu: 2 people;
  * Oriol: 5 people;
  * David: 2 people;
Result: 
  * Iosu seats: 'A1', 'B1'; 
  * Oriol seats: 'D1', 'E1', 'F1', 'E2', 'F2'; 
  * David seats: 'A2', 'B2'; 

Bookings: 
  * Iosu: 2 people;
  * Gerard: 2 people;
Result: 
  * Iosu seats: 'A1', 'B1'; 
  * Gerard seats: 'E1', 'F1'; 
```

You should:

- Add information about your design decision.
- Write production-ready code.
- Design the code in order to be extensible.
- Suggest possible enhancements
- Provide the source code with all the git history and the description about how to execute the code.
