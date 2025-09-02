SMODS.Joker {
  key = "glorp",
  atlas = "jokers",
  pos = { x = 5, y = 0 },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  calculate = function(self, card, context)
    if context.joker_main then
      local add = mult
      return { mult = add }
    end
  end
}
