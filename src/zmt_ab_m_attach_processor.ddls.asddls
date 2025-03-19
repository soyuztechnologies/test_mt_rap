@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'processor'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zmt_ab_m_attach_processor as projection on zmt_ab_m_attach
{
    key TravelId,
    key Id,
    Memo,
    @Semantics.largeObject: {
        mimeType: 'Filetype',
        fileName: 'Filename',
        contentDispositionPreference: #INLINE,
        acceptableMimeTypes: [ 'application/pdf' ]
    }
    Attachment,
    Filename,
    @Semantics.mimeType: true
    Filetype,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Travel: redirected to parent ZMT_AB_TRAVEL_PROCESSOR
}
