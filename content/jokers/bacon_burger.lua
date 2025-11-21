SMODS.Joker {
  key = "bacon_burger",
  atlas = "jokers",
  pos = { x = 1, y = 3 },
  config = { extra = {
    xchips = 0.9,
    xmult = 2.5,
    lifespan = 5
  } },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xchips,
      card.ability.extra.xmult,
      card.ability.extra.lifespan
    } }
  end,

  calculate = function(self, card, context)
    -- give score
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
        xchips = card.ability.extra.xchips
      }
    end

    -- decrement lifespan
    if context.after and not context.blueprint then
      card.ability.extra.lifespan = card.ability.extra.lifespan - 1
      if card.ability.extra.lifespan == 0 then
        SMODS.destroy_cards(card)
      end
      return {
        message = localize("bacon_burger_eat")
      }
    end
  end
}
