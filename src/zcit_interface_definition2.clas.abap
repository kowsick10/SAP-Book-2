CLASS zcit_interface_definition2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCIT_INTERFACE_DEFINITION2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lo_partner TYPE REF TO lif_partner.

    " 1. Test Airline
    lo_partner = NEW lcl_airline( ).
    " This call works now because the method returns a string
    out->write( lo_partner->get_partner_attributes( ) ).

    " 2. Test Car Rental
    lo_partner = NEW lcl_car_rental( ).
    out->write( lo_partner->get_partner_attributes( ) ).

  ENDMETHOD.
ENDCLASS.
