CLASS zcl_mt_ab_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA lv_mode type c VALUE 'D'.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mt_ab_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    case lv_mode.
      when 'R'.

          READ ENTITIES OF ZMT_AB_TRAVEL
          ENTITY Travel
          FIELDS ( TravelId BeginDate TotalPrice )
          WITH VALUE #( ( TravelId = '00000011' )
           ( TravelId = '00000015' )
            ( TravelId = '89569636' ) )
          RESULT data(lt_result)
          FAILED data(lt_failed)
          REPORTED data(lt_message).

          out->write(
            EXPORTING
              data   = lt_result
*              name   =
*            RECEIVING
*              output =
          ).

          out->write(
            EXPORTING
              data   = lt_failed
*              name   =
*            RECEIVING
*              output =
          ).

           out->write(
            EXPORTING
              data   = lt_message
*              name   =
*            RECEIVING
*              output =
          ).
        when 'C'.

            data(lv_description) = 'Anubhav Rocks with RAP'.
            data(lv_agency) = '070016'.
            data(lv_customer) = '000697'.

            MODIFY ENTITIES OF ZMT_AB_TRAVEL
            ENTITY Travel
            CREATE FIELDS ( TravelId AgencyId CurrencyCode BeginDate EndDate Description OverallStatus )
            WITH VALUE #(
                            (
                              %CID = 'ANUBHAV'
                              TravelId = '00012347'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
                            ( %CID = 'ANUBHAV-1'
                              TravelId = '00012358'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
                             (
                              %CID = 'ANUBHAV-2'
                              TravelId = '00000010'
                              AgencyId = lv_agency
                              CustomerId = lv_customer
                              BeginDate = cl_abap_context_info=>get_system_date( )
                              EndDate = cl_abap_context_info=>get_system_date( ) + 30
                              Description = lv_description
                              OverallStatus = 'O'
                             )
             )
             MAPPED data(lt_mapped)
             FAILED lt_failed
             REPORTED lt_message.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).
        when 'U'.

            lv_description = 'Wow, That was an update'.
            lv_agency = '070032'.

            MODIFY ENTITIES OF ZMT_AB_TRAVEL
            ENTITY Travel
            UPDATE FIELDS ( AgencyId Description )
            WITH VALUE #(
                            ( TravelId = '00001133'
                              AgencyId = lv_agency
                              Description = lv_description
                             )
                            ( TravelId = '00001135'
                              AgencyId = lv_agency
                              Description = lv_description
                             )
             )
             MAPPED lt_mapped
             FAILED lt_failed
             REPORTED lt_message.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).
        when 'D'.

        MODIFY ENTITIES OF ZMT_AB_TRAVEL
            ENTITY Travel
            DELETE FROM VALUE #(
                            ( TravelId = '00012347'
                             )
             )
             MAPPED lt_mapped
             FAILED lt_failed
             REPORTED lt_message.

             COMMIT ENTITIES.

             out->write(
              EXPORTING
                data   = lt_mapped
            ).

            out->write(
              EXPORTING
                data   = lt_failed
            ).

    endcase.

  ENDMETHOD.
ENDCLASS.
