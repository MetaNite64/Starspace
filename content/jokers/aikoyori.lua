SMODS.Joker {
    key = "aikoyori",
    atlas = "jokers",
    pos = {x = 5, y = 7},
    config = {extra = {xmult = 1.984}},
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local count = -3
        for _, v in pairs(SMODS.Mods) do
            if next(SMODS.find_mod(v.id)) then
                count = count + 1
            end
        end
        return {vars = {card.ability.extra.xmult, card.ability.extra.xmult * count}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local count = -3
            for _, v in pairs(SMODS.Mods) do
                if next(SMODS.find_mod(v.id)) then
                    count = count + 1
                end
            end
            return {xmult = {card.ability.extra.xmult * count}}
        end
    end,
}