SMODS.Joker {
  key = "shard",
  atlas = "jokers",
  pos = { x = 6, y = 0 },
  rarity = "star_cosmic",
  cost = 18,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_it",
  pools = {
    friends_of_astro = true
  },

  calculate = function(self, card, context)
    if context.retrigger_joker_check and context.other_card ~= card and not context.blueprint then
      if context.other_card == G.jokers.cards[1] then
        return {
          repetitions = 2
        }
      end
    end
  end
}
