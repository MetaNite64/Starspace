SMODS.Joker {
  key = "jimothy",
  atlas = "jokers",
  pos = { x = 12, y = 2 },
  config = { extra = {
    type = "star_flash",
    chips = 0,

  } },
  rarity = 2,
  cost = 7,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    local cae = card.ability.extra
    return { vars = {
      localize(card.ability.extra.type, "poker_hands"),
      G.GAME.hands["star_flash"].level,
      cae.chips
    } }
  end,

  calculate = function(self, card, context)
    local cae = card.ability.extra
    if context.individual and context.cardarea == G.play then
        if context.other_card:get_id() == 10 then
            cae.chips = cae.chips + G.GAME.hands["star_flash"].level
            return{
                message = localize("k_upgrade_ex"),
                message_colour = G.C.CHIPS,
                message_card = card
            }
        end
    end
    if context.joker_main then
        return{
            xmult = G.GAME.hands["star_flash"].level,
            chips = cae.chips
        }
    end
end
}
