---@diagnostic disable: undefined-global
return T {
    Frame = T {
        Size = 60,
    },
    Group = T {
        Spacing = 10,
    },
    Crossbar = T {
        Spacing = 16,
    },
    --Fonts are defaulted to Windows fonts, but some open-source fonts may look better
    --Recommended font replacements are:
    --'Segoe UI' -> 'Hind' for Name/Cost,
    --'Arial Black' -> 'Eurostar Black Extended' for Palette/Hotkey, and
    --'MS Gothic' -> 'Warsaw Gothic' for Recast
    --though these may all require tweaking sizes/weights etc
    Name = T {
        Typeface = 'Segoe UI',
        Size = 18,
        FontColor = Color.White,
        Alignment = Font.Alignment.Center,
        Outline = 0x99335599,
    },
    Hotkey = T {
        Typeface = 'Arial Black',
        Size = 12,
        FontColor = Color.White,
        Alignment = Font.Alignment.Left,
        Outline = Color.Black,
    },
    Recast = T {
        Typeface = 'MS Gothic',
        Size = 28,
        FontColor = 0xFFDDDDDD,
        Alignment = Font.Alignment.Center,
        Weight = Font.Weight.Bold,
        Outline = Color.Black,
    },
    Cost = T {
        Typeface = 'Segoe UI',
        Size = 18,
        FontColor = 0xFFFFE0FF,
        Alignment = Font.Alignment.Left,
        Outline = 0xFF662266,
    },
    Palette = T {
        Typeface = 'Arial Black',
        Size = 22,
        FontColor = 0xFFFFFAEE,
        Alignment = Font.Alignment.Left,
    },
}
