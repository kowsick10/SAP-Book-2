*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_demo DEFINITION.
  PUBLIC SECTION.
    METHODS use_work_area.
    METHODS use_field_symbol.
  PRIVATE SECTION.
    " Using a standard table type for the exercise
    TYPES t_flights TYPE STANDARD TABLE OF /dmo/flight WITH NON-UNIQUE KEY carrier_id connection_id flight_date.

    METHODS loop_field_symbol CHANGING c_flights TYPE t_flights.
    METHODS loop_work_area    CHANGING c_flights TYPE t_flights.
ENDCLASS.

CLASS lcl_demo IMPLEMENTATION.

  METHOD use_field_symbol.
    DATA flights TYPE t_flights.
    SELECT FROM /dmo/flight FIELDS * INTO TABLE @flights UP TO 10 ROWS.
    loop_field_symbol( CHANGING c_flights = flights ).
  ENDMETHOD.

  METHOD use_work_area.
    DATA flights TYPE t_flights.
    SELECT FROM /dmo/flight FIELDS * INTO TABLE @flights UP TO 10 ROWS.
    loop_work_area( CHANGING c_flights = flights ).
  ENDMETHOD.

  METHOD loop_field_symbol.
    LOOP AT c_flights ASSIGNING FIELD-SYMBOL(<ls_flight>).
      " Direct modification via pointer (Field Symbol)
      <ls_flight>-seats_occupied = <ls_flight>-seats_occupied + 1.
    ENDLOOP. " Removed the extra ENDLOOP that was here
  ENDMETHOD.

  METHOD loop_work_area.
    LOOP AT c_flights INTO DATA(ls_flight).
      " Modify the local copy
      ls_flight-seats_occupied = ls_flight-seats_occupied + 1.
      " Must explicitly write the copy back to the original table
      MODIFY c_flights FROM ls_flight.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
