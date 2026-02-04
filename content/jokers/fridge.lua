SMODS.Joker {
  key = "fridge",
  atlas = "jokers",
  pos = { x = 9, y = 9},
  config = { extra = {
    rounds = 0,
    rounds_max = 3

  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = {
      cae.rounds,
      cae.rounds_max
    } }
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.end_of_round and context.main_eval and not context.blueprint then
        if cae.rounds < cae.rounds_max then
            cae.rounds = cae.rounds + 1
        else
            cae.rounds = 0
            card:juice_up()
            card:set_ability("j_star_frorange")
        end
    end
end
}
