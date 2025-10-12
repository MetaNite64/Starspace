SMODS.Consumable {
  key = "retribution",
  set = "Spectral",
  atlas = "consumables",
  pos = { x = 1, y = 0 },

  can_use = function(self, card)
    return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
  end,

  use = function(self, card, area)
    local rarities = {}
    for i, v in pairs(SMODS.Rarities) do
      if v.default_weight > 0 then
        table.insert(rarities, i)
      end
    end
    local rarity = pseudorandom_element(rarities, "star_retribution")

    G.E_MANAGER:add_event(Event({
      trigger = "after",
      delay = 0.4,
      func = function()
        if G.jokers.config.card_limit > #G.jokers.cards then
          play_sound("timpani")
          SMODS.add_card { set = "Joker", rarity = rarity }
          card:juice_up(0.3, 0.5)
        end
        return true
      end
    }))
    delay(0.6)
  end
}
