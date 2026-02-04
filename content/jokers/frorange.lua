SMODS.Joker {
  key = "frorange",
  atlas = "jokers",
  pos = { x = 10, y = 9},
  config = { extra = {
    xmult = 3

  } },
  rarity = "star_concealed",
  cost = 7,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = {
      cae.xmult,
    } }
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.joker_main then
        return{
            xmult = cae.xmult
        }
    end
end
}
