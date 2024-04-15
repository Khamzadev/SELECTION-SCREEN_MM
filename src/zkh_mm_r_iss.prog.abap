*&---------------------------------------------------------------------*
*& Include          ZKH_MM_R_ISS
*&---------------------------------------------------------------------*


SELECTION-SCREEN BEGIN OF BLOCK one WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS : so_mate  FOR ekpo-matnr,
                   so_plant FOR ekpo-werks,
                   so_por   FOR ekko-ekorg,
                   so_dt    FOR ekko-bsart,
                   so_dd    FOR ekko-aedat,
                   so_dn    FOR ekpo-ebelp,
                   so_suppl FOR ekko-lifnr,
                   so_sp    FOR ekko-reswk.
SELECTION-SCREEN END OF BLOCK one.
