-- table of valid contexts
local contexts = {
  "initial_scoring_step",
  "individual",
  "joker_main",
  "other_joker",
  "final_scoring_step"
}

SMODS.Joker {
  key = "glorp",
  atlas = "jokers",
  pos = { x = 5, y = 0 },
  rarity = 2,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  pronouns = "it_its",
  pools = {
    friends_of_astro = true
  },

  config = { extra = {
    current_context = "joker_main",
    xmult = 2
  } },

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.extra.xmult,
      card.ability.extra.current_context
    } }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    -- pick a new context
    card.ability.extra.current_context = pseudorandom_element(contexts, "glorp_contexts")
  end,

  calculate = function(self, card, context)
    -- pick a new context
    if context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.current_context = pseudorandom_element(contexts, "glorp_contexts")
    end

    -- give xmult
    if context[card.ability.extra.current_context] and not context.end_of_round 
    and (context.cardarea == G.play or context.cardarea == G.jokers or context.other_joker) then
      return { xmult = 2 }
    end
  end
}
