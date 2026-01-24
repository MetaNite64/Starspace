SMODS.Joker({
    key = "rise_of_kingdoms",
    atlas = "jokers",
    cost = 4,
    rarity = 1,
    pronouns = "she_her",
    pos = { x = 4, y = 9},
    config = {
        extra = {
            power_gain = 1000000,
            power = 0,
            chips = 0

        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        cae.chips = cae.power^(7/24)
        return{
            vars = {cae.power_gain, cae.power, cae.chips}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.setting_blind and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "power",
                scalar_value = "power_gain",
                message_colour = G.C.CHIPS
            })
        end

        if context.joker_main then
            return{
                chips = cae.power^(7/24)
            }
        end
    end
})