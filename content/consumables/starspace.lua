SMODS.Consumable {
  key = "starspace",
  set = "Spectral",
  atlas = "placeholder",
  pos = { x = 0, y = 0 },
  hidden = true,
  soul_set = "Spectral",
  soul_rate = 0.003,

  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,

  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        play_sound("timpani")
        SMODS.add_card( { set = "Joker", rarity = "star_galactic" } )
        card:juice_up(0.3, 0.5)
        return true
      end
    }))
    delay(0.6)
  end
}
