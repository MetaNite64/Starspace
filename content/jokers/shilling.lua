SMODS.Joker({
    key = "ms_small_penny_rolls",
    atlas = "jokers",
    cost = 6,
    rarity = 2,
    pos = { x = 6, y = 4 },
    config = {
        extra = {
            mult = 30,
            mult_gain = 2

        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.mult, cae.mult_gain}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
    end
})