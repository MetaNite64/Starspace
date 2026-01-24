SMODS.Joker({
    key = "grapefruit_soda",
    atlas = "jokers",
    cost = 7,
    rarity = 2,
    pos = { x = 3, y = 8 },
    config = {
        extra = {
            x_payout = 5, -- i didn't check gamesets...
            x_payout_lose = 0.1,

            dollars = 10,
            dollars_lose = 1,
            dollars_current = 10
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.dollars, cae.dollars_lose, cae.dollars_current, cae.x_payout, cae.x_payout_lose}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.pre_discard and not context.blueprint then
            if cae.dollars_current>1 then
                SMODS.scale_card(card, {
                    ref_table = cae,
                    operation = "-",
                    ref_value = "dollars_current",
                    scalar_value = "dollars_lose",
                    scaling_message = {
                        message = "-"..cae.dollars_lose,
                        colour = G.C.MONEY,
                    }

                })
            else
                SMODS.destroy_cards(card)
                return{
                    message = localize("k_eaten_ex")
                }
            end
        end
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars_current
    end
})