*&---------------------------------------------------------------------*
*& Report zkh_mm_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkh_mm_report.

* Program tables
INCLUDE zkh_mm_r_t.

* Defining program data
INCLUDE zkh_mm_r_top.

* Implementation of the class
INCLUDE zkh_mm_r_cli.

* Implementation of the screen is selected
INCLUDE zkh_mm_r_iss.


START-OF-SELECTION.

  CREATE OBJECT lo_output.

  TRY.
      lo_output->get_data(
        EXPORTING
          it_so_mate  = so_mate[]
          it_so_plant = so_plant[]
          it_so_por   = so_por[]
          it_so_dt    = so_dt[]
          it_so_dd    = so_dd[]
          it_so_dn    = so_dn[]
          it_so_suppl = so_suppl[]
          it_so_sp    = so_sp[]
        IMPORTING
          et_data     = gt_data ).
    CATCH cx_salv_msg INTO DATA(lx_msg).
      MESSAGE lx_msg TYPE 'E'.
  ENDTRY.

  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table  = Gt_data ).
    CATCH cx_salv_msg INTO lx_msg.
      MESSAGE lx_msg TYPE 'E'.
  ENDTRY.


  TRY.
      lr_columns = lo_alv->get_columns( ).
      lr_column ?= lr_columns->get_column( 'DELIVERY_NUMBER' ).
      lr_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
    CATCH cx_salv_not_found.
  ENDTRY.

  o_events = lo_alv->get_event( ).

  SET HANDLER lcl_events=>on_double_click FOR o_events.

  SET HANDLER lcl_events=>on_link_click FOR o_events.

  lo_alv->get_functions( )->set_all( abap_true ).

  lo_alv->display( ).
