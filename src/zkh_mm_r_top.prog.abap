*&---------------------------------------------------------------------*
*& Include          ZKH_MM_R_TOP
*&---------------------------------------------------------------------*

DATA: gt_data   TYPE TABLE OF zkh_mm_cds,
      lo_output TYPE REF TO zkh_material_query_executor,
      lo_alv    TYPE REF TO cl_salv_table,
      o_events  TYPE REF TO cl_salv_events_table,
      lr_columns TYPE REF TO cl_salv_columns_table,
         lr_column  TYPE REF TO cl_salv_column_table.
