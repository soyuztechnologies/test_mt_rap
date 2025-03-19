@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor travel entity'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZMT_AB_TRAVEL_APPROVER 
    as projection on ZMT_AB_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    AgencyName,
    CustomerName,
    Status,
    Criticality,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZMT_AB_BOOKING_APPROVER,
    _Currency,
    _Customer,
    _OverallStatus
}
