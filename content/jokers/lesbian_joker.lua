SMODS.Joker({
    key = "lesbian_joker",
    atlas = "jokers",
    cost = 4,
    rarity = 1,
    pronouns = "she_her",
    pos = { x = 7, y = 4 },
    config = {
        extra = {
            queens = 2,
            mult = 10,
            dollars = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {cae.queens, cae.mult, cae.dollars}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            local q = 0
            for k, v in pairs(G.play.cards) do
                if v and v:get_id() == 12 then
                    q = q + 1
                end
            end

            if q >= cae.queens then
                return{
                    mult = cae.mult,
                    dollars = cae.dollars
                }
            end
        end
    end
})