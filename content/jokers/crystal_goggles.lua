SMODS.Joker {
  key = "crystal_goggles",
  atlas = "jokers",
  pos = { x = 9, y = 1 },
  config = { extra = {
    cards = {
      "c_jupiter",
      "c_sigil",
      "c_fool"
    }
  } },
  rarity = 1,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  
  loc_vars = function(self, info_queue, card)
    for _, v in ipairs(card.ability.extra.cards) do
      info_queue[#info_queue + 1] = G.P_CENTERS[v]
    end
    return { vars = {
      localize { type = "name_text", key = "c_jupiter", set = "Planet" },
      localize { type = "name_text", key = "c_sigil", set = "Spectral" },
      localize { type = "name_text", key = "c_fool", set = "Tarot" },
      colours = {
        G.C.SECONDARY_SET.Planet,
        G.C.SECONDARY_SET.Spectral,
        G.C.SECONDARY_SET.Tarot
      }
    } }
  end,

  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_left == 0 then
      if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        local create = pseudorandom_element(card.ability.extra.cards, "star_crystal_goggles")
        G.E_MANAGER:add_event(Event({
          func = function()
            SMODS.add_card { key = create }
            G.GAME.consumeable_buffer = 0
            return true
          end
        }))
        return { message = localize("k_goggles_ex") }
      end
    end
  end
}
