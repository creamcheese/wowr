module Wowr
  module Armory
    module Item
      # Cost can be gold or a set of required tokens
      # See ItemCostToken
      # <cost sellPrice="280" buyPrice="5600"></cost>
      # <cost>
      #   <token icon="spell_holy_championsbond" id="29434" count="60"></token>
      # </cost>
      class Cost
        attr_reader :buy_price, :sell_price, :tokens, :honor_price, :arena_price

        def initialize(elem)
          @honor_price = Money.new(elem[:honor].to_i) if elem[:honor]
          @arena_price = Money.new(elem[:arena].to_i) if elem[:arena]
          @buy_price  = Money.new(elem[:buyPrice].to_i) if elem[:buyPrice]
          @sell_price = Money.new(elem[:sellPrice].to_i)  if elem[:sellPrice]

          if (elem%'token')
            @tokens = []
            (elem/:token).each do |token|
              @tokens << ItemCostToken.new(token)
            end
          end
        end
      end
    end
  end
end