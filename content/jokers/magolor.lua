SMODS.Joker {
  key = "magolor",
  atlas = "jokers",
  pos = { x = 0, y = 2 },
  config = { extra = {
    discount = 10,
    discount_gain = 5,
    discount_max = 50
  } },
  rarity = 2,
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.discount .. "%",
      card.ability.extra.discount_gain .. "%",
      card.ability.extra.discount_max .. "%"
    } }
  end,

  add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        G.GAME.discount_percent = (G.GAME.discount_percent or 0) + card.ability.extra.discount
        for _, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,

  remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
      func = function()
        G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.discount
        for _, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end,

  calculate = function(self, card, context)
    if context.end_of_round and context.cardarea == G.jokers and context.beat_boss and not context.blueprint then
      if card.ability.extra.discount < card.ability.extra.discount_max then
        card.ability.extra.discount = card.ability.extra.discount + card.ability.extra.discount_gain
        G.E_MANAGER:add_event(Event({
          func = function()
            G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.discount_gain
            for _, v in pairs(G.I.CARD) do
              if v.set_cost then v:set_cost() end
            end
            return true
          end
        }))
        return {
          message = localize("k_upgrade_ex"),
          colour = G.C.MONEY
        }
      end
    end
  end
}

-- take ownership of clearance sale and liquidation to account for other discount sources
SMODS.Voucher:take_ownership("clearance_sale", {
  redeem = function(self, card)
    G.E_MANAGER:add_event(Event({
      func = function()
        G.GAME.discount_percent = (G.GAME.discount_percent or 0) + card.ability.extra
        for _, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end
})

SMODS.Voucher:take_ownership("liquidation", {
  config = { extra = 25 },
  redeem = function(self, card)
    G.E_MANAGER:add_event(Event({
      func = function()
        G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra
        for _, v in pairs(G.I.CARD) do
          if v.set_cost then v:set_cost() end
        end
        return true
      end
    }))
  end
})
