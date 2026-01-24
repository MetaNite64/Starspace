SMODS.Joker({
    key = "sans",
    atlas = "jokers",
    cost = 1,
    rarity = 1,
    pos = { x = 4, y = 8 },
    config = {
        extra = {
            mult = 1,
            chips = 1,
            dollars = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.mult, cae.chips, cae.dollars}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            return{
                mult = cae.mult,
                chips = cae.chips,
                dollars = cae.dollars
            }
        end
    end
})