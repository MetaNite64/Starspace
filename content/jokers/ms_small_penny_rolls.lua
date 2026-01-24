SMODS.Joker({
    key = "ms_small_penny_rolls",
    atlas = "jokers",
    cost = 5,
    rarity = 2,
    pos = { x = 2, y = 8},
    config = {
        extra = {
            dollars = 8,
            dollar_limit = 4

        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.dollars, cae.dollar_limit}
        }
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        if to_big(G.GAME.dollars)<=cae.dollar_limit then
            return cae.dollars
        end
    end
})