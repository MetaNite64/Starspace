SMODS.Joker {
  key = "combo_pizza",
  atlas = "jokers",
  pos = { x = 2, y = 7 },
  config = { extra = {
    xchips = 2.5,
    xmult = 1.75,
    chips = 125,
    mult = 25,
    money = 10,
    lifespan = 16
  } },
  rarity = 3,
  cost = 10,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = false,
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xchips,
      card.ability.extra.xmult,
      card.ability.extra.chips,
      card.ability.extra.mult,
      card.ability.extra.money,
      card.ability.extra.lifespan
    } }
  end,

  calculate = function(self, card, context)
    -- give score
    if context.joker_main then
      local roll1 = pseudorandom("combo_pizza", 1, 5)
      local roll2 = roll1
      while roll2 == roll1 do
        roll2 = pseudorandom("combo_pizza", 1, 5)
      end
      local effects = {
        { xchips = card.ability.extra.xchips },
        { xmult = card.ability.extra.xmult },
        { chips = card.ability.extra.chips },
        { mult = card.ability.extra.mult },
        { dollars = card.ability.extra.money }
      }
      effect = effects[roll1]
      effect.extra = effects[roll2]
      return effect
    end

    -- decrement lifespan
    if context.end_of_round and context.main_eval and not context.blueprint then
      card.ability.extra.lifespan = card.ability.extra.lifespan - 1
      if card.ability.extra.lifespan == 0 then
        SMODS.destroy_cards(card)
      end
      return {
        message = localize("combo_pizza_eat")
      }
    end
  end
}
