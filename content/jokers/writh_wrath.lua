SMODS.Joker {
  key = "writh_wrath",
  atlas = "jokers",
  pos = { x = 0, y = 4 },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = "e_negative", set = "Edition", config = { extra = 1 } }
  end,
  
  calculate = function(self, card, context)
    if context.setting_blind and context.blind.boss then
      G.E_MANAGER:add_event(Event({
        func = function()
          SMODS.add_card {
            set = "Joker",
            rarity = "Common",
            edition = "e_negative",
            key_append = "star_writh_wrath"
          }
          return true
        end
      }))
      return {
        message = localize("k_plus_joker"),
        colour = G.C.RED
      }
    end
  end
}
