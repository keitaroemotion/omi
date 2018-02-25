module Lib
    class Const
        class << self
            def apis
                %w(
                  card
                  charge
                  customer
                  dispute
                  refund
                  token
                  recipient
                  transfer
                  schedule
                  trsch
                )
            end    

            def apis_pl
                %w(
                  cards
                  charges
                  customers
                  disputes
                  refunds
                  tokens
                  recipients
                  transfers
                  schedules
                  trschs
                )
            end    
        end    
    end    
end
