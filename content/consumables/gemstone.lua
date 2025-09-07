SMODS.Consumable {
  key = "gemstone",
  set = "Spectral",
  atlas = "consumables",
  pos = { x = 2, y = 1 },

  config = { extra = { seal = "star_emerald" }, max_highlighted = 1 },

  use = function(self, card, area, copier)
    local conv_card = G.hand.highlighted[1]
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound("tarot1")
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.1,
      func = function()
        conv_card:set_seal(card.ability.extra.seal, nil, true)
        return true
      end
    }))

    delay(0.5)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.2,
      func = function()
        G.hand:unhighlight_all()
        return true
      end
    }))
  end
}
