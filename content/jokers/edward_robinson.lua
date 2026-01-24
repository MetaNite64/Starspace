SMODS.Joker({
    key = "edward_robinson",
    atlas = "jokers",
    cost = 5,
    rarity = 1,
    pos = { x = 5, y = 9},
    config = {
        extra = {
            mult_gain = 1,
            mult = 0

        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.mult_gain, cae.mult}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card:get_id() == 14 then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "mult_gain",
                message_colour = G.C.MULT
            })
        end

        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
    end
})