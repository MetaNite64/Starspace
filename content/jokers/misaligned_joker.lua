SMODS.Joker({
    key = "misaligned_joker",
    atlas = "jokers",
    cost = 5,
    rarity = 1,
    pos = { x = 8, y = 4 },
    config = {
        extra = {
            trigger = true,
            mult = 16,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.mult}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and cae.trigger then
            cae.trigger = false
            return{
                mult = cae.mult,
            }
        end
        if context.after and not context.blueprint then
            cae.trigger = true
        end
    end
})