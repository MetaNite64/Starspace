SMODS.Consumable {
  key = "illusioned",
  set = "Spectral",
  atlas = "consumables",
  pos = { x = 0, y = 0 },

  loc_vars = function(self, info_queue, card)
    local illusioned_c = G.GAME.starspace.last_spectral and G.P_CENTERS[G.GAME.starspace.last_spectral] or nil
    local last_spectral = illusioned_c and localize { type = "name_text", key = illusioned_c.key, set = illusioned_c.set } or localize("k_none")
    local colour = (not illusioned_c or illusioned_c.key == "c_star_illusioned" or illusioned_c.hidden) and G.C.RED or G.C.GREEN

    if not (not illusioned_c or illusioned_c.key == "c_star_illusioned" or illusioned_c.hidden) then
      info_queue[#info_queue + 1] = illusioned_c
    end

    local main_end = { {
      n = G.UIT.C,
      config = { align = "bm", padding = 0.02 },
      nodes = { {
        n = G.UIT.C,
        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
        nodes = { { n = G.UIT.T, config = { text = " " .. last_spectral .. " ", colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } } }
      } }
    } }

    return { vars = { last_spectral }, main_end = main_end }
  end,

  can_use = function(self, card)
    local legal = true
    if not G.GAME.starspace.last_spectral or
          G.P_CENTERS[G.GAME.starspace.last_spectral].hidden or
          G.GAME.starspace.last_spectral == "c_star_illusioned" then
      legal = false
    end
    return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and legal
  end,

  use = function(self, card, area)
    local key = G.GAME.starspace.last_spectral
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        if G.consumeables.config.card_limit > #G.consumeables.cards then
          play_sound("timpani")
          SMODS.add_card { key = key }
          card:juice_up(0.3, 0.5)
        end
        return true
      end
    }))
    delay(0.6)
  end
}
