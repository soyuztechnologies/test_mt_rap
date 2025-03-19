@AbapCatalog.sqlViewName: 'ZMTABBPACDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds basics'
@Metadata.ignorePropagatedAnnotations: true
define view zmt_ab_bpa_cds as select from zmt_ab_bpa
{
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as Country,
    region as Region,
    city as City
}
