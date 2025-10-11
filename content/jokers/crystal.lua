SMODS.Joker {
  key = "crystal",
  atlas = "jokers",
  pos = { x = 2, y = 0 },
  rarity = "star_cosmic",
  cost = 18,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "she_her",
  pools = {
    friends_of_astro = true
  },

  calculate = function(self, card, context)
    if context.retrigger_joker_check and context.other_card ~= card and not context.blueprint then
      local other_joker = nil
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          other_joker = G.jokers.cards[i + 1]
          break
        end
      end
      if other_joker == context.other_card then
        return {
          repetitions = 2
        }
      end
    end
  end
}
