return {
  descriptions = {
    Edition = {
      e_star_astral = {
        name = "Astral",
        text = {
          "{X:chips,C:white}X#1#{} Chips per",
          "{C:attention}Joker owned",
          "when scored",
          "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)"
        }
      },
      e_star_otherworldly = {
        name = "Otherworldly",
        text = {
          "Gives the {C:attention}4th root{}",
          "of {C:chips}Chips{} as {X:mult,C:white}XMult{}",
          "when scored"
        }
      }
    },
    Joker = {
      j_star_aikoyori = {
        name = "Aikoyori",
        text = {
          "Gives {X:mult,C:white}X#1#{} Mult",
          "per installed mod",
          "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}"
        }
      },
      j_star_artful_joker = {
        name = "Artful Joker",
        text = {
          "{C:attention}+#1#{} hand size if",
          "a hand containing",
          "a {C:attention}#2#{}",
          "was played this round"
        }
      },
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
      j_star_astronomical_joker = {
        name = "Astronomical Joker",
        text = {
          "Gains {C:chips}+#1#{} Chips for every",
          "{C:hearts}Heart{} card destroyed.",
          "Loses {C:chips}#1#{} Chips for every",
          "{C:spades}Spade{} card destroyed",
          "{C:inactive}(Currently {C:chips}#2#{C:inactive} Chips){}"
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
      j_star_chronological_joker = {
        name = "Chronological Joker",
        text = {
          "Gains {C:mult}+#1#{} Mult for every",
          "{C:spades}Spade{} card destroyed.",
          "Loses {C:mult}#1#{} Mult for every",
          "{C:hearts}Heart{} card destroyed",
          "{C:inactive}(Currently {C:mult}#2#{C:inactive} Mult){}"
        }
      },
      j_star_colon3c = {
        name = ":3c",
        text = {
          "{C:chips}+#1#{} Chips",
          "{C:mult}+#2#{} Mult",
          "{C:green}#3# in #4#{} chance to give",
          "{C:attention}3X{} the listed values",
          "{C:green}#5# in #6#{} chance to give",
          "{X:attention,C:white}33X{} the listed values"
        }
      },
      j_star_combo_pizza = {
        name = "Combo Pizza",
        text = {
          "Randomly gives 2 of 5 effects:",
          "{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult,",
          "{C:chips}+#3#{} Chips, {C:mult}+#4#{} Mult, or {C:money}+$#5#{}",
          "Eaten in {C:attention}#6#{} rounds"
        }
      },
      j_star_creature = {
        name = "The Creature",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "and {C:mult}+#2#{} Mult for every",
          "{C:attention}Joker{} owned when",
          "{C:attention}Boss Blind{} is defeated",
          "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips, {C:mult}+#4#{C:inactive} Mult){}"
        }
      },
      j_star_crystal = {
        name = "Crystal",
        text = {
          "Copy the {C:attention}Jokers{} to the",
          "{C:attention}left{} and {C:attention}right{} of this Joker"
        }
      },
      j_star_crystal_goggles = {
        name = "Crystal's Goggles",
        text = {
          "On the {C:attention}final hand{} of the round,",
          "randomly create a {V:1}#1#{}, {V:2}#2#{}",
          "or {V:3}#3#{}",
          "{C:inactive}(Must have room){}"
        }
      },
      j_star_deceitful_joker = {
        name = "Deceitful Joker",
        text = {
          "{C:attention}+#1#{} hand size if",
          "a hand containing",
          "a {C:attention}#2#{}",
          "was played this round"
        }
      },
      j_star_edward_robinson = {
        name = "Edward Robinson",
        text = {
          "Gains {C:mult}+#1#{} Mult",
          "for each scored {C:attention}Ace{}",
          "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
      },
      j_star_fluffy_joker = {
        name = "Fluffy Joker",
        text = {
          "{C:mult}+#1#{} Mult if played",
          "hand contains",
          "a {C:attention}#2#{}"
        }
      },
      j_star_galacta_knight = {
        name = "Galacta Knight",
        text = {
          { "{C:attention}Glass{} cards never break" },
          {
            "{C:attention}Lucky{} cards' probabilities",
            "are {C:attention}quadrupled{}"
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
      j_star_grapefruit_soda_alt = { --ugh/ ignore this
        name = "Grapefruit Soda",
        text = {
          "{C:money}X#4#{} Payout Money",
          "{C:money}-X#5#{} per discard"
        }
      },
      j_star_grapefruit_soda = { 
        name = "Grapefruit Soda",
        text = {
          "{C:money}$#1#{} at the",
          "end of a round.",
          "{C:money}-$#2#{} per discard",
          "{C:inactive}(Currently {C:money}+$#3#{C:inactive})"
        }
      },
      j_star_guileful_joker = {
        name = "Guileful Joker",
        text = {
          "{C:attention}+#1#{} hand size if",
          "a hand containing",
          "a {C:attention}#2#{}",
          "was played this round"
        }
      },
      j_star_lesbian_joker = {
        name = "Lesbian Joker",
        text = {
          "If played hand contains",
          "{C:attention}#1#{} or more {C:attention}Queens,", 
          "this Joker gives", 
          "{C:mult}+#2#{} Mult and {C:money}+$#3#{}"
        }
      },
      j_star_magolor = {
        name = "Magolor",
        text = {
          "All cards and packs in shop",
          "gain a {C:money}#1#{} discount.",
          "Increase discount by {C:money}#2#{}",
          "when {C:attention}Boss Blind{} is defeated",
          "{C:inactive}(Maximum of {C:money}#3#{C:inactive}){}"
        }
      },
      j_star_marx = {
        name = "Marx",
        text = {
          "Played {C:clubs}Clubs{} give {X:chips,C:white}X#1#{} Chips.",
          "Played {C:hearts}Hearts{} give {X:mult,C:white}X#1#{} Mult"
        }
      },
      j_star_meta = {
        name = "Meta",
        text = {
          "When a {C:attention}hand{} is played,",
          "this Joker gains {C:mult}+#2#{} Mult",
          "and increases that gain by {C:attention}#3#{}",
          "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}"
        }
      },
      j_star_meta_knight = {
        name = "Meta Knight",
        text = {
          {
            "{C:attention}Enhance{} one random card",
            "in the deck to {C:attention}Steel{}",
            "when {C:attention}Blind{} is selected",
            "{s:0.8,C:inactive}(Weighted towards unenhanced cards){}"
          },
          {
            "All played {C:attention}Steel{} cards earn",
            "{C:money}$#1#{} cards when scored"
          }
        }
      },
      j_star_misaligned_joker = {
        name = "Misaligned Joker",
        text = {
          {
            "Played cards score",
            "in a {C:dark_edition}random{} order",
            "{C:attention}First{} scored card",
            "gives {C:mult}+#1#{} Mult"
          },
        }
      },
      j_star_ms_small_penny_rolls = {
        name = "Ms. Small Penny Rolls",
        text = {
          {
            "{C:money}+$#1#{} if the blind",
            "is beaten with",
            "{C:money}$#2#{} or less",
          },
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
      j_star_prideful_joker = {
        name = "Prideful Joker",
        text = {
          "{C:attention}+#1#{} hand size if",
          "a hand containing",
          "a {C:attention}#2#{}",
          "was played this round"
        }
      },
      j_star_rise_of_kingdoms = {
        name = "Rise of Kingdoms",
        text = {
          "Gains {C:attention}+#1#{} Power",
          "when blind is selected.",
          "{C:chips}+Power^(7/24){} Chips.",
          "{C:inactive}(Currently {C:attention}#2#{C:inactive} Power, {C:chips}+#3#{C:inactive} Chips)"
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
      j_star_sage_halo = {
        name = "Sage's Halo",
        text = {
          "If {C:attention}first hand{} of round contains",
          "{C:attention}exactly{} three {C:attention}6{}s,",
          "convert 6 random cards in full",
          "deck into {C:attention}Lucky{} cards",
          "{s:0.8,C:inactive}(Weighted towards unenhanced cards){}"
        }
      },
      j_star_sans = {
        name = "Sans",
        text = {
          "{C:attention}Scored Cards{} give",
          "{C:mult}+#1#{} Mult, {C:chips}+#2#{} Chips",
          "and {C:money}+$#3#{}",
          '{C:inactive}"The easiest enemy."'
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
      j_star_scrap_machete = {
        name = "Scrap's Machete",
        text = {
          "If {C:attention}first hand{} of round is a single {C:attention}card{},",
          "destroy it and create 3 new cards: one with",
          "the same {C:attention}rank{}, one with the same {C:attention}suit{},",
          "and one with the same",
          "{C:attention}edition, enhancement, and seal{}"
        }
      },
      j_star_seraphic_joker = {
        name = "Seraphic Joker",
        text = {
          "{C:attention}Gold{} and {C:attention}Lucky{} cards give",
          "{C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult",
          "when {C:attention}held in hand{}"
        }
      },

      j_star_shard = {
        name = "Shard",
        text = {
          "Copy the {C:attention}leftmost{}",
          "and {C:attention}rightmost{} Jokers"
        }
      },
      j_star_shilling = {
        name = "Shilling",
        text = {
          "Gives {C:mult}+#1#{} Mult per",
          "documented mod {C:attention}Astro{}",
          "is in",
          '{C:inactive}"Add me to your balatro mod"'
        }
      },
      j_star_shy_joker = {
        name = "Shy Joker",
        text = {
          "{C:chips}+#1#{} Chips if played",
          "hand contains",
          "a {C:attention}#2#{}"
        }
      },
      j_star_sleightful_joker = {
        name = "Sleightful Joker",
        text = {
          "{C:attention}+#1#{} hand size if",
          "a hand containing",
          "a {C:attention}#2#{}",
          "was played this round"
        }
      },
      j_star_susie = {
        name = "Susie",
        text = {
          "This Joker gains {C:chips}+#1#{} Chips",
          "per {C:attention}played{} and {C:attention}scored{} card",
          "at the end of scoring",
          "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
      },
      j_star_the_spacial = {
        name = "The Spacial",
        text = {
          "{X:purple,C:white}X#1#{} Chips and Mult if",
          "played hand contains",
          "a {C:attention}#2#{}"
        }
      },
      j_star_thoughtful_joker = {
        name = "Thoughtful Joker",
        text = {
          "{C:attention}+#1#{} hand size if",
          "a hand containing",
          "a {C:attention}#2#{}",
          "was played this round"
        }
      },
      j_star_writh_wrath = {
        name = "Writh Wrath",
        text = {
          "When {C:attention}Boss Blind{} is selected,",
          "create a {C:dark_edition}Negative{}",
          "{C:common}Common{} {C:attention}Joker{}"
        }
      },
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
      star_cleansing = {
        name = "Cleansing",
        text = {
          "Upgrades edition",
          "every {C:attention}#1#{} rounds",
          "{C:inactive}({C:attention}#2#{C:inactive} remaining)"
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
      star_immortal = {
        name = "Immortal",
        text = {
          "Can't be destroyed",
          "{C:inactive}(Can still be sold){}"
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
    Planet = {
      c_star_wolftopia = {
        name = "Wolftopia",
        text = {
          "({V:1}lvl.#1#{}) Level up",
          "{C:attention}#2#{}",
          "{C:mult}+#3#{} Mult and",
          "{C:chips}+#4#{} Chips"
        }
      }
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
      c_star_illusioned = {
        name = "The Illusioned",
        text = {
          "Creates the last",
          "{C:spectral}Spectral{} card used",
          "during this run",
          "{s:0.8,C:spectral}The Illusioned{s:0.8} and any{}",
          "{s:0.8}hidden{s:0.8,C:spectral} Spectrals{s:0.8} excluded"
        }
      },
      c_star_retribution = {
        name = "Retribution",
        text = {
          "Creates a random",
          "{C:attention}Joker{} card.",
          "All rarities that can",
          "appear in the shop are",
          "weighted equally",
          "{C:inactive}(Must have room){}"
        }
      },
      c_star_starspace = {
        name = "Starspace",
        text = { {
          "Creates a",
          "{C:star_galactic,E:1}Galactic{} Joker",
          "{C:inactive}(Must have room){}"
        },
        {
          "{C:red}Resets all hand{}",
          "{C:red}levels to 1{}"
        } }
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
      v_star_heist = {
        name = "Heist",
        text = {
          "{C:dark_edition}Hidden{} consumables are",
          "{C:attention}5{} times more",
          "likely to appear"
        }
      },
      v_star_shoplift = {
        name = "Shoplift",
        text = {
          "Consumables can be selected",
          "from {C:attention}Booster Packs{}",
          "for later use"
        }
      },

      -- edited from vanilla
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
    challenge_names = {
      c_star_point_deduction_5 = "Point Deduction 5"
    },
    v_text = {
      ch_c_star_point_deduction_5 = { "{C:red}X0.5 score{}" }
    },
    dictionary = {
      k_plus_steel_ex = "Steel!",
      k_plus_lucky_ex = "Lucky!",
      k_plus_trigger_ex = "+1 Trigger",
      k_cant_upgrade_ex = "Upgrade Failed!",
      k_machete_ex = "Scrapped!",
      k_goggles_ex = "Crafted!",
      k_star_cosmic = "Cosmic",
      k_star_galactic = "Galactic",
      star_patches = "Patches",
      bacon_burger_eat = "Nomf...",
      combo_pizza_eat = "Nomf...",

      star_ui_squad = "Core Team",
      star_ui_artists = "Artists",
      star_ui_coders = "Coders",
      star_ui_shaders = "Shaders",
    },
    v_dictionary = {
      a_handsize = "+#1# Hand Size"
    },
    labels = {
      -- Rarities
      k_star_cosmic = "Cosmic",
      k_star_galactic = "Galactic",

      -- Editions
      star_astral = "Astral",
      star_otherworldly = "Otherworldly",

      -- Seals
      star_bronze_seal = "Bronze Seal",
      star_emerald_seal = "Emerald Seal",
      star_rose_gold_seal = "Rose Gold Seal",

      -- Stickers
      star_gigantic = "Gigantic",
      star_isolated = "Isolated",

      -- Patches
      star_brave = "Brave",
      star_cleansing = "Cleansing",
      star_efficient = "Efficient",
      star_generous = "Generous",
      star_immortal = "Immortal",
    },
    poker_hands = {
      star_flash = "Flash",
      star_royal_flash = "Royal Flash",
    },
    poker_hand_descriptions = {
      star_flash = {
        "4 cards with different suits"
      }
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
