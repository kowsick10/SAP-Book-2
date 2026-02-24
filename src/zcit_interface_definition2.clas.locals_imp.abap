*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

" --- 1. INTERFACE DEFINITION ---
INTERFACE lif_partner.
  " FIX: Added RETURNING parameter so it can be called in expressions
  METHODS get_partner_attributes RETURNING VALUE(rv_text) TYPE string.
ENDINTERFACE.


" --- 2. CLASS: Airline ---
CLASS lcl_airline DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_partner.
ENDCLASS.

CLASS lcl_airline IMPLEMENTATION.
  METHOD lif_partner~get_partner_attributes.
    rv_text = 'Airline Partner: Lufthansa'.
  ENDMETHOD.
ENDCLASS.


" --- 3. CLASS: Car Rental ---
CLASS lcl_car_rental DEFINITION.
  PUBLIC SECTION.
    INTERFACES lif_partner.
ENDCLASS.

CLASS lcl_car_rental IMPLEMENTATION.
  METHOD lif_partner~get_partner_attributes.
    rv_text = 'Car Rental Partner: Sixt'.
  ENDMETHOD.
ENDCLASS.
