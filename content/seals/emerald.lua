SMODS.Seal {
  key = "emerald",
  atlas = "card_mods",
  pos = { x = 2, y = 0 },
  badge_colour = STAR_UTIL.colors.emerald,

  -- thanks Entropy
  calculate = function(self, card, context)
    if (context.cardarea == G.play or context.cardarea == G.hand) and context.scoring_hand and not context.emerald_trigger then
      for i, v in ipairs(context.scoring_hand) do
        if v.seal and v ~= card then
          context.emerald_trigger = true
          local eval, post = eval_card(v, context)
          local effects = { eval }

          if context.main_scoring then
            eval.chips = v.base.nominal + v.ability.bonus or 0
            SMODS.calculate_context( {
              individual = true,
              other_card = v,
              cardarea = v.area,
              scoring_hand = context.scoring_hand
            } )
          end

          for _, v in ipairs(post or {}) do effects[#effects + 1] = v end

          if eval.retriggers then
            for rt = 1, #eval.retriggers do
              local rt_eval, rt_post = eval_card(v, context)
              table.insert(effects, { eval.retriggers[rt] } )
              table.insert(effects, rt_eval)

              for _, v in ipairs(rt_post) do effects[#effects + 1] = v end

              if context.main_scoring then
                table.insert(effects, { chips = v.base.nominal + v.ability.bonus or 0 } )
                SMODS.calculate_context( {
                  individual = true,
                  other_card = v,
                  cardarea = v.area,
                  scoring_hand = context.scoring_hand
                } )
              end
            end
          end
          SMODS.trigger_effects(effects, v)
        end
      end
      context.emerald_trigger = nil
    end
  end,

  -- thanks VanillaRemade
  draw = function(self, card, layer)
    if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
      G.shared_seals[card.seal].role.draw_major = card
      G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
      G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end
}
