return {
  descriptions = {
    Joker = {
      j_star_astro = {
        name = "Astro",
        text = {
          "This Joker gains {X:chips,C:white}X#1#{} Chips",
          "when a {C:spades}Spade{} is scored,",
          "unless a {C:hearts}Heart{} is",
          "in the scored hand",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)"
        }
      },
      j_star_bacon_burger = {
        name = "Bacon Burger",
        text = {
          "{X:mult,C:white}X#2#{} Mult",
          "{X:chips,C:white}X#1#{} Chips",
          "Eaten after {C:attention}#3#{} hands"
        }
      },
      j_star_crystal = {
        name = "Crystal",
        text = {
          "Retrigger the {C:attention}Joker{} to",
          "the right #1# times"
        }
      },
      j_star_galacta_knight = {
        name = "Galacta Knight",
        text = {
          { "{C:attention}Glass{} cards never break" },
          {
            "{C:attention}Lucky{} cards' probabilities",
            "are guaranteed"
          }
        }
      },
      j_star_glorp = {
        name = "Glorp",
        text = {
          "{X:mult,C:white}X#1#{} Mult during",
          "{C:attention}context.#2#{},",
          "context changes at",
          "end of round"
        }
      },
      j_star_magolor = {
        name = "Magolor",
        text = {
          "All cards and pack in shop",
          "gain a {C:money}#1#{} discount.",
          "Increase discount by {C:money}#2#{}",
          "when {C:attention}Boss Blind{} is defeated",
          "{C:inactive}(Maximum of {C:money}#3#{C:inactive}){}"
        }
      },
      j_star_meta_knight = {
        name = "Meta Knight",
        text = {
          {
            "Add one {C:attention}Steel{} card to the deck",
            "when {C:attention}Blind{} is selected"
          },
          {
            "All played {C:attention}Steel{} cards become",
            "{C:attention}Gold{} cards when scored"
          }
        }
      },
      j_star_paradoxical_joker = {
        name = "Paradoxical Joker",
        text = {
          "This Joker gains {C:mult}+#1#{} Mult",
          "if played poker hand",
          "is a {C:attention}secret hand{}",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
      },
      j_star_plus2 = {
        name = "+2",
        text = {
          "{s:10,E:1,C:star_plus2}+2{}"
        }
      },
      j_star_rocket_pop = {
        name = "Rocket Pop",
        text = {
          "This Joker gains #2# {C:attention}trigger{} and",
          "loses {X:mult,C:white}#1#{} of its current {C:mult}xMult{}",
          "at the end of the round",
          "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult, {C:attention}#4#{C:inactive} #5#)"
        }
      },
      j_star_sage = {
        name = "Sage",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "every time {C:gold}money{} is",
          "earned during scoring",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },
      j_star_scrap = {
        name = "Scrap",
        text = {
          "This Joker gains {X:mult,C:white}X#1#{} Mult",
          "when a {C:hearts}Heart{} is scored,",
          "unless a {C:spades}Spade{} is",
          "in the scored hand",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
        }
      },
      j_star_shard = {
        name = "Shard",
        text = {
          "Retrigger the leftmost",
          "{C:attention}Joker{} #1# times"
        }
      }
    },
    Other = {
      -- Seals
      star_bronze_seal = {
        name = "Bronze Seal",
        text = {
          "{C:attention}Level up{} the played hand",
          "once for every other {C:attention}seal{}",
          "in the {C:attention}scoring hand{}"
        }
      },
      star_emerald_seal = {
        name = "Emerald Seal",
        text = {
          "Retrigger every other",
          "card with a {C:attention}seal{}",
          "in {C:attention}scoring hand{}"
        }
      },
      star_rose_gold_seal = {
        name = "Rose Gold Seal",
        text = {
          "Earn {C:money}$#1#{} per",
          "{C:attention}seal{} played in",
          "{C:attention}scoring hand{}"
        }
      },

      -- Stickers
      star_gigantic = {
        name = "Gigantic",
        text = {
          "Takes up an",
          "extra slot"
        }
      },
      star_isolated = {
        name = "Isolated",
        text = {
          "Flips over during",
          "{C:attention}blinds{} and shuffles",
          "itself among other",
          "Isolated cards"
        }
      },

      -- Patches
      star_brave = {
        name = "Brave",
        text = {
          "Cannot be flipped",
          "or debuffed"
        }
      },
      star_efficient = {
        name = "Efficient",
        text = {
          "Takes up half",
          "as many slots"
        }
      },
      star_generous = {
        name = "Generous",
        text = {
          "Earn {C:money}$2{} at",
          "end of round"
        }
      },

      -- Stake Stickers
      star_amber_sticker = {
        name = "Amber Sticker",
        text = {
          "Used this Joker",
          "to win on {C:attention}Amber{}",
          "{C:attention}Stake{} difficulty"
        }
      },
      star_amethyst_sticker = {
        name = "Amethyst Sticker",
        text = {
          "Used this Joker",
          "to win on {C:attention}Amethyst{}",
          "{C:attention}Stake{} difficulty"
        }
      },
    },
    Spectral = {
      c_star_conductivity = {
        name = "Conductivity",
        text = {
          "Add a {C:star_bronze}Bronze Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand"
        }
      },
      c_star_eclipse = {
        name = "Eclipse",
        text = {
          "Add a {C:star_rose_gold}Rose Gold Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand"
        }
      },
      c_star_gemstone = {
        name = "Gemstone",
        text = {
          "Add an {C:star_emerald}Emerald Seal{}",
          "to {C:attention}1{} selected",
          "card in your hand"
        }
      },
      c_star_starspace = {
        name = "Starspace",
        text = {
          "Creates a",
          "{C:star_galactic,E:1}Galactic{} Joker",
          "{C:inactive}(Must have room){}"
        }
      }
    },
    Stake = {
      stake_star_amber = {
        name = "Amber Stake",
        text = {
          "Shop can have {C:attention}Isolated{} Jokers",
          "{s:0.8,C:inactive}(flips and shuffles during Blinds){}",
          "{s:0.8}Applies Gold Stake{}"
        }
      },
      stake_star_amethyst = {
        name = "Amethyst Stake",
        text = {
          "Shop can have {C:attention}Gigantic{} Jokers",
          "{s:0.8,C:inactive}(takes up an extra Joker slot){}",
          "{s:0.8}Applies Amber Stake{}"
        }
      }
    },
    Voucher = {
      v_clearance_sale = {
        name = "Clearance Sale",
        text = {
          "All cards and packs",
          "in shop gain a",
          "{C:money}#1#%{} discount"
        }
      },
      v_liquidation = {
        name = "Liquidation",
        text = {
          "All cards and packs in",
          "shop gain an additional",
          "{C:money}#1#%{} discount"
        }
      }
    },
  },
  misc = {
    dictionary = {
      k_plus_steel_ex = "+1 Steel",
      k_plus_trigger_ex = "+1 Trigger",
      k_star_cosmic = "Cosmic",
      k_star_galactic = "Galactic",
      star_patches = "Patches",
      bacon_burger_eat = "Nomf...",
    },
    labels = {
      k_star_cosmic = "Cosmic",
      k_star_galactic = "Galactic",

      star_bronze_seal = "Bronze Seal",
      star_emerald_seal = "Emerald Seal",
      star_rose_gold_seal = "Rose Gold Seal",

      star_gigantic = "Gigantic",
      star_isolated = "Isolated",

      star_brave = "Brave",
      star_efficient = "Efficient",
      star_generous = "Generous",
    },
    quips = {
      star_astro_win_1 = { "TETRATION!!!!!" },
      star_astro_win_2 = { "Look!", "It's me!" },
      star_astro_win_3 = { "Hamburber ...", ":3" },
      star_astro_win_4 = { "This really was", "a Balatrotale." },
      star_astro_win_5 = { "Mreow!" },

      star_astro_lose_1 = { "Mreow!" },
      star_astro_lose_2 = { "Please don't", "tell Scrap..." },
      star_astro_lose_3 = { "I- I'm flabbergasted..." },
      star_astro_lose_4 = { "...It's okay! Bet'cha", "you'll find me in", "the next run!" },
      star_astro_lose_5 = { "Master Plan", "my ass!" },

      star_scrap_win_1 = { "Great minds think", "alike, Player." },
      star_scrap_win_2 = { "Well met." },
      star_scrap_win_3 = { "Good thinking, Player.", "I'm impressed." },
      star_scrap_win_4 = { "Sorry, how many Chips?" },

      star_scrap_lose_1 = { "I swear to god." },
      star_scrap_lose_2 = { "Use that brain", "of yours!" },
      star_scrap_lose_3 = { "Screw this, I'm making", "myself some apple pie..." },
      star_scrap_lose_4 = { "HISSSSSS" },

      star_sage_win_1 = { "ALL of the arrows!" },
      star_sage_win_2 = { "All of that time", "calculating and you STILL", "barely cleared Ante 4." },
      star_sage_win_3 = { "Pet the Astro.", "Pet the Scrap." },
      star_sage_win_4 = { "Call these televisions", "CRTs the way they", "be purrin" },
      star_sage_win_5 = { "Mrrrow..." },

      star_sage_lose_1 = { "Mrrrow..." },
      star_sage_lose_2 = { "Meet'cha in Heaven." },
      star_sage_lose_3 = { "Get in, loser.", "We're going to", "another run." },
      star_sage_lose_4 = { "Arright, who put", "hamburgers in", "the engine?" },
      star_sage_lose_5 = { "I'm not gonna", "plan your ass, Astro." }
    }
  }
}
