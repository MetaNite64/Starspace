SMODS.Joker {
  key = "crystal",
  atlas = "jokers",
  pos = { x = 2, y = 0 },
  rarity = "star_cosmic",
  cost = 18,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_her",
  pools = {
    friends_of_astro = true
  },

  loc_vars = function(self, info_queue, card)
    if card.area and card.area == G.jokers then
      local left_joker = nil
      local right_joker = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          left_joker = G.jokers.cards[i - 1]
          right_joker = G.jokers.cards[i + 1]
        end
      end
      local left_compatible = left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat
      local right_compatible = right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat

      local main_end = { {
        n = G.UIT.C,
        config = { align = "bm", minh = 0.4 },
        nodes = { {
          n = G.UIT.C,
          config = {
            ref_table = card,
            align = "m",
            colour = left_compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
            r = 0.05,
            padding = 0.06
          },
          nodes = { {
            n = G.UIT.T,
            config = {
              text = ' ' .. localize('k_' .. (left_compatible and 'compatible' or 'incompatible')) .. ' ',
              colour = G.C.UI.TEXT_LIGHT,
              scale = 0.32 * 0.8
            }
          } }
        }, {
          n = G.UIT.C,
          config = {
            ref_table = card,
            align = "m",
            colour = right_compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
            r = 0.05,
            padding = 0.06
          },
          nodes = { {
            n = G.UIT.T,
            config = {
              text = ' ' .. localize('k_' .. (right_compatible and 'compatible' or 'incompatible')) .. ' ',
              colour = G.C.UI.TEXT_LIGHT,
              scale = 0.32 * 0.8
            }
          } }
        } }
      } }

      return { main_end = main_end }
    end
  end,

  calculate = function(self, card, context)
    local left_joker = nil
    local right_joker = nil
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then
        left_joker = G.jokers.cards[i - 1]
        right_joker = G.jokers.cards[i + 1]
      end
    end
    local left_effect = SMODS.blueprint_effect(card, left_joker, context)
    local right_effect = SMODS.blueprint_effect(card, right_joker, context)
    return SMODS.merge_effects { left_effect or {}, right_effect or {} }
  end
}
