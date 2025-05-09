SMODS.Joker {
    key = "examplejoker",
    pos = {x = 0, y = 0},
    rarity = 3,
    atlas = "PLH",
    config = { extra = {X_mult = 1, mult_mod = 0.15} },
    cost = 6,
    loc_vars = function (self, info_queue, center)
        return { vars = { center.ability.extra.X_mult, center.ability.extra.mult_mod } }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play then 
            card.ability.extra.X_mult = card.ability.extra.X_mult + card.ability.extra.mult_mod -- this is how we make the jokers Xmult Scale with each scored card
        end
        if context.cardarea == G.jokers and context.joker_main then
            return {Xmult_mod = card.ability.extra.X_mult}
        end
    end,
}
