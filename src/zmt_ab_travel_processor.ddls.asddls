@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Processor travel entity'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZMT_AB_TRAVEL_PROCESSOR 
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
    _Booking: redirected to composition child ZMT_AB_BOOKING_PROCESSOR,
    _Attachments: redirected to composition child zmt_ab_m_attach_processor,
    _Currency,
    _Customer,
    _OverallStatus,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_MT_AB_VE_CALC'
    @EndUserText.label: 'CO2 Tax'
    virtual CO2Tax : abap.int4,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_MT_AB_VE_CALC'
    @EndUserText.label: 'Week Day'
    virtual dayOfTheFlight : abap.char( 9 )
}
