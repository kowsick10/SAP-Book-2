CLASS zcit_22cs083_t DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCIT_22CS083_T IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  out->write( TEXT-001 ).
  out->write( text-hav ).

  out->write( text-hau ).
  ENDMETHOD.
ENDCLASS.
