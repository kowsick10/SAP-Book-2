CLASS zcit_22cs083_io DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCIT_22CS083_IO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
SELECT FROM /dmo/agency AS a
       LEFT OUTER JOIN /dmo/customer AS c
         ON a~city = c~city

       FIELDS a~agency_id,
              a~name        AS agency_name,
              a~city        AS agency_city,
              c~city        AS customer_city,
              c~customer_id,
              c~last_name  AS customer_name

       WHERE ( c~customer_id < '000010' OR c~customer_id IS NULL )
         AND ( a~agency_id   < '070010' OR a~agency_id   IS NULL )

       INTO TABLE @DATA(result_join).

out->write(
  EXPORTING
    data = result_join
    name = 'RESULT_JOIN'
).


  ENDMETHOD.
ENDCLASS.
