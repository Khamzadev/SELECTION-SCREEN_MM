*&---------------------------------------------------------------------*
*& Include          ZKH_MM_R_CLI
*&---------------------------------------------------------------------*


CLASS lcl_events DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS on_double_click
      FOR EVENT if_salv_events_actions_table~double_click
      OF cl_salv_events_table
      IMPORTING row column.

    CLASS-METHODS on_link_click FOR EVENT link_click OF cl_salv_events_table
      IMPORTING row column.



  PRIVATE SECTION.
    TYPES: BEGIN OF ty_selected_row,
             ebeln           TYPE ekpo-ebeln,
             delivery_number TYPE ekes-vbeln,
           END OF ty_selected_row.
ENDCLASS.

CLASS lcl_events IMPLEMENTATION.
  METHOD on_link_click.
  DATA: ls_selected_row TYPE ty_selected_row.
  ls_selected_row-delivery_number = gt_data[ row ]-delivery_number.

  IF sy-subrc = 0.
    SET PARAMETER ID 'VLM' FIELD ls_selected_row-delivery_number.
    CALL TRANSACTION 'VL33N' AND SKIP FIRST SCREEN .
  ENDIF.
ENDMETHOD.


METHOD on_double_click.
  DATA: ls_selected_row TYPE ty_selected_row.

  IF row > 0.
    ls_selected_row-ebeln = gt_data[ row ]-ebeln.

    CALL FUNCTION 'ME_DISPLAY_PURCHASE_DOCUMENT'
      EXPORTING
        i_ebeln = ls_selected_row-ebeln.
  ENDIF.
ENDMETHOD.

ENDCLASS.
