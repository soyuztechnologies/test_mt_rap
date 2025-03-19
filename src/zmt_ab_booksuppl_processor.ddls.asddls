@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplement processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMT_AB_BOOKSUPPL_PROCESSOR as projection on ZMT_AB_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking: redirected to parent ZMT_AB_BOOKING_PROCESSOR,
    _Product,
    _SupplementText,
    _Travel: redirected to ZMT_AB_TRAVEL_PROCESSOR
}
