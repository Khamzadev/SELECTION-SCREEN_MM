@AbapCatalog.sqlViewName: 'ZKH_CDS_MM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDC implementation for MM'

define view ZKH_MM_CDS
// Joining three tables using the INNER JOIN operator in the 'ebeln' field
  as select from ekko as purchase_header
    inner join ekpo as purchase_item on purchase_header.ebeln = purchase_item.ebeln
    left outer join ekes as delivery_details on purchase_item.ebeln = delivery_details.ebeln
{
// Getting the necessary fields from the ekko, ekpo, ekes tables
  key purchase_item.ebeln       as ebeln,
  key purchase_item.ebelp as item_number,
      purchase_item.matnr       as material,
      purchase_item.werks       as plant,
      purchase_header.ekorg     as purchasing_organization,
      purchase_header.bsart     as purchasing_document_type,
      purchase_header.aedat     as document_date,
      purchase_header.lifnr     as vendor,
      purchase_header.reswk     as supplying_plant,
      delivery_details.vbeln    as delivery_number,
      delivery_details.eindt    as delivery_date
}
