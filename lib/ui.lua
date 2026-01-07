-- credits stuff. thanks again paperback
SMODS.current_mod.extra_tabs = function()
local result = {}

for k, v in pairs(STAR_UTIL.credits) do
    local parsed = {}

    for _, entry in ipairs(v.entries) do
        parsed[#parsed + 1] = {
            n = G.UIT.R,
            config = { align = 'cm', minh = 0.25 },
            nodes = {
                { n = G.UIT.T, config = { text = entry, colour = v.colour, scale = 0.4 } }
            }
        }
        end

        result[k] = parsed
        end

        local credits_tab = {
            n = G.UIT.ROOT,
            config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
            nodes = {
                {
                    n = G.UIT.R,
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { padding = 0.5 },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cm' },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('star_ui_squad'), colour = G.C.WHITE, scale = 0.75 } },
                                    }
                                },
                                unpack(result.squad)
                            }
                        },
                        {
                            n = G.UIT.C,
                            config = { padding = 0.5 },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cm' },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('star_ui_artists'), colour = G.C.WHITE, scale = 0.75 } },
                                    }
                                },
                                unpack(result.artists)
                            }
                        },
                        {
                            n = G.UIT.C,
                            config = { padding = 0.5 },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cm' },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('star_ui_coders'), colour = G.C.WHITE, scale = 0.75 } },
                                    }
                                },
                                unpack(result.coders)
                            }
                        },
                        {
                            n = G.UIT.C,
                            config = { padding = 0.5 },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = 'cm' },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('star_ui_shaders'), colour = G.C.WHITE, scale = 0.75 } }
                                    }
                                },
                                unpack(result.shaders)
                            }
                        }
                    }
                }
            }
        }

        return {
            {
                label = localize('b_credits'),
                tab_definition_function = function()
                return credits_tab
                end
            }
        }
end
