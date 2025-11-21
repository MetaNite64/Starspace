SMODS.Joker {
  key = "meta_knight",
  atlas = "jokers",
  pos = { x = 1, y = 2 },
  config = { extra = { dollars = 2 } },
  rarity = "star_cosmic",
  cost = 15,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "he_him",

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    return { vars = { card.ability.extra.dollars } }
  end,

  calculate = function(self, card, context)
    -- make random card steel at start of blind
    if context.setting_blind then

      local to_steel = pseudorandom_element(G.playing_cards, "meta_knight_pick")
      while true do
        if pseudorandom("meta_knight_give_up") < (1 / (next(SMODS.get_enhancements(to_steel)) and 8 or 1)) then break end
        to_steel = pseudorandom_element(G.playing_cards, "meta_knight_pick")
      end
      to_steel:set_ability("m_steel")
      
      return {
        message = localize('k_plus_steel_ex'),
        colour = G.C.SECONDARY_SET.Enhanced
      }
    end

    -- steel cards give $2 when scored
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if SMODS.has_enhancement(context.other_card, "m_steel") then
        return {
          dollars = card.ability.extra.dollars
        }
      end
    end
  end
}
