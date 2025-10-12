STAR_UTIL.Patch {
  key = "cleansing",
  badge_colour = HEX("4F5DA1"),
  atlas = "card_mods",
  pos = { x = 2, y = 2 },
  patch_sticker = "perishable",
  config = { extra = {
    total_rounds = 3,
    rounds = 3
  } },

  loc_vars = function(self, info_queue, card)
    return { vars = {
      card.ability.star_cleansing.extra.total_rounds,
      card.ability.star_cleansing.extra.rounds
    } }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual then
      card.ability.star_cleansing.extra.rounds = card.ability.star_cleansing.extra.rounds - 1
      if card.ability.star_cleansing.extra.rounds <= 0 then
        card.ability.star_cleansing.extra.rounds = card.ability.star_cleansing.extra.total_rounds

        local index = 2
        if card.edition then
          for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
            if v.key == card.edition.key then
              index = i + 1
              break
            end
          end
        end

        if index > #G.P_CENTER_POOLS.Edition then
          return {
            message = localize("k_cant_upgrade_ex"),
            colour = G.C.PURPLE
          }
        end

        local new_edition = G.P_CENTER_POOLS.Edition[index]
        if new_edition.key == "e_negative" then
          -- temp until we start adding custom editions
          return {
            message = localize("k_cant_upgrade_ex"),
            colour = G.C.PURPLE
          }
        end

        card:set_edition(new_edition.key)
        return {
          message = localize("k_upgrade_ex"),
          colour = G.C.PURPLE
        }
      else
        return {
          message = localize { type = "variable", key = "a_remaining", vars = { card.ability.star_cleansing.extra.rounds } },
          colour = G.C.PURPLE
        }
      end
    end
  end
}
