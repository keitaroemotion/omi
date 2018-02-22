module Lib
    class Translation
        class << self
            def translate_schedule
              {
                list:         "list_all",
                create_daily: "create_daily",
                create_days_in_month: "create_days_in_month",
              }
            end

            def translate_customer
              {
                  delete:    "destroy_a_customer",
                  create_wc: "create_a_customer_and_attach_a_card",
                  create:    "create_a_customer",
                  add_card:  "attach_a_card_to_customer",
                  list:      "list_all_customers",
                  list_all:  "list_all_customers",
                  get:       "retrieve_a_customer",
                  update:    "update_a_customer",
              }
            end
            
            def translate_token
                {
                    create: "create_a_token", 
                    get:    "retrieve_a_token",
                }
            end
            
            def translate_card
                {
                    delete:   "destroy_a_card",
                    list:     "list_all_cards",
                    list_all: "list_all_cards",
                    get:      "retrieve_a_card",
                    update:   "update_a_card",
                }
            end
            
            def translate_charge
                {
                    list:     "list_all_charges",
                    list_all: "list_all_charges",
                    update:   "update_a_charge", 
                    reverse:  "reverse_an_uncaptured_charge",
                    get:      "retrieve_a_charge",
                    coib:     "create_an_offsite_internet_banking_charge",
                    coa:      "create_an_offsite_alipay_charge",
                    wt:       "charge_a_card_using_a_token",
                    wcc:      "charge_a_card_using_a_customer_and_a_card",
                    wc:       "charge_a_card_using_a_customer",
                    capture:  "capture_an_authorized_charge",
                }
            end
            
            def translate_dispute
                {
                    list:     "list_all_disputes",
                    list_all: "list_all_disputes",
                    lao:      "list_all_open_disputes",
                    lap:      "list_all_pending_disputes",
                    lac:      "list_all_closed_disputes",
                    get:      "retrieve_a_dispute",
                    update:   "update_a_dispute",
                }
            end
            
            def translate_recipient
                {
                    list:    "list_all_recipient",
                    create:  "create_a_recipient",
                    get:     "retrieve_a_recipient",
                    update:  "update_a_recipient",
                    delete:  "destroy_a_recipient" 
                }
            end
            
            def translate_refund
                {
                    list:     "list_all_refunds",
                    list_all: "list_all_refunds",
                    lap:      "list_all_refunds_of_particular_charge",
                    get:      "retrieve_a_refund",
                    create:   "create_a_refund",
                }
            end
            
            def translate_transfer
                {
                    create:   "create_a_transfer",
                    cr3:      "create_a_transfer_to_third_party_recipient",
                    delete:   "destroy_a_transfer",
                    list:     "list_all_transfers",
                    get:      "retrieve_a_transfer",
                    update:   "update_a_transfer",
                }
            end
        end    
    end
end    
