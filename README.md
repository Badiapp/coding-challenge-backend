# Airplane booking system

Badi flight company needs to add a booking system to the current application.

Our fleet is composed by 2 types of aircraft:


| Aircraft Type | Sits Count  | Rows        | Row Arrangement          |
|---------------|-------------|-------------|--------------------------|
| :short_range  | 156         | 26          | A B C _ D E F            |
| :long_range   | 360         | 36          | A B C _ D E F G _ H I J  |


The task is to write the logic that describe the booking service.

The booking service should be versatile to be working for both `:short_range` and `:long_range` flights

The booking system allows to receive a multiple seats request.

When the service receives a multiple seats request, it should chose the seats following the rules described below:

- If the number of person is inferior of the lane size, you should sit them all in line
- [Optional] If the number of person is greater then the lane size, you should place the seat nearby on multiple lanes. (Ex. for a short range airplane if we book 4 places they can be set an B1, C1, B2, C2)

The service should expose the following interface:

- Create new booking.
- Book one or more seats.
- Show if the give seat is booked.
- Cancel a booking from the given booking reference.
- Show the seats disposition.

You should:

- Provide a the source code, some description about the design decision and the instruction about how to execute the it.
- Write production-ready code.
- Design the code in order to be extensible.
