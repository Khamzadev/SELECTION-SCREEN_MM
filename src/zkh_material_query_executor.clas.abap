CLASS zkh_material_query_executor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: get_data
      IMPORTING
        it_so_mate  TYPE TABLE
        it_so_plant TYPE TABLE
        it_so_por   TYPE TABLE
        it_so_dt    TYPE TABLE
        it_so_dd    TYPE TABLE
        it_so_dn    TYPE TABLE
        it_so_suppl TYPE TABLE
        it_so_sp    TYPE TABLE
      EXPORTING
        et_data     TYPE TABLE.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zkh_material_query_executor IMPLEMENTATION.


  METHOD get_data.
    SELECT ebeln,  item_number, material, plant, purchasing_organization, purchasing_document_type, document_date, vendor, supplying_plant, delivery_number, delivery_date
      FROM zkh_cds_mm INTO TABLE @et_data
      WHERE material IN @it_so_mate
        AND plant IN @it_so_plant
        AND purchasing_organization IN @it_so_por
        AND purchasing_document_type IN @it_so_dt
        AND document_date IN @it_so_dd
        AND item_number IN @it_so_dn
        AND vendor IN @it_so_suppl
        AND supplying_plant IN @it_so_sp.
  ENDMETHOD.
ENDCLASS.

