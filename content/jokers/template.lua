SMODS.Joker {
  key = "template",
  atlas = "jokers",
  pos = { x = 0, y = 0 },
  config = { extra = {
  } },
  rarity = 1,
  cost = 4,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,
  pronouns = "he_him",
  
  loc_vars = function(self, info_queue, card)
    return { vars = {
    } }
  end,

  calculate = function(self, card, context)
  end
}
