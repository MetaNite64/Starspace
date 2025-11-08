SMODS.Joker {
  key = "angelic_joker",
  atlas = "jokers",
  pos = { x = 3, y = 1 },
  config = { extra = {
    mult = 6,
    chips = 66
  } },
  rarity = "star_cosmic",
  cost = 21,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_her",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.mult,
      card.ability.extra.chips
    } }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if SMODS.has_enhancement(context.other_card, "m_gold") or SMODS.has_enhancement(context.other_card, "m_lucky") then
        if context.other_card.debuff then
          return {
            message = localize("k_debuffed"),
            colour = G.C.RED
          }
        end
        return {
          chips = card.ability.extra.chips,
          mult = card.ability.extra.mult
        }
      end
    end
  end
}
