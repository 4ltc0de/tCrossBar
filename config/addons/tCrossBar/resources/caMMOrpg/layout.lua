---@diagnostic disable: undefined-global
local FramesPerCrossbar = 8
local GroupsPerCrossbar = 2
local FramesPerGroup = FramesPerCrossbar / GroupsPerCrossbar
Color = T {
    White = 0xFFFFFFFF,
    Black = 0xFF000000,
    Black_50 = 0x80000000,
    Transparent = 0x00000000,
}
Font = T {
    Alignment = T {
        Left = 0,
        Center = 1,
        Right = 2,
    },
    Weight = T {
        Regular = 0,
        Bold = 1,
    },
}
Font.Default = {
    Typeface = 'Arial',
    Color = Color.White,
    Alignment = Font.Alignment.Left,
    Weight = Font.Weight.Regular,
    Size = 20,
    Width = 0,
    Height = 0,
    Outline = Color.Transparent,
    Gradient = {
        Color = Color.Transparent,
        Style = 0,
    },
    OffsetX = 0,
    OffsetY = 0
}

local CaMMOrpg = dofile(GetResourcePath(ResRoot .. 'style.lua'));

local function WithDefaults(object)
    object.box_width = object.Width or Font.Default.Width
    object.box_height = object.Height or Font.Default.Height
    object.font_family = object.Typeface or Font.Default.Typeface
    object.font_color = object.FontColor or Font.Default.Color
    object.font_height = object.Size or Font.Default.Size
    object.font_alignment = object.Alignment or Font.Default.Alignment
    object.font_flags = object.Weight or Font.Default.Weight
    object.gradient_color = (object.Gradient or Font.Default.Gradient).Color
    object.gradient_style = (object.Gradient or Font.Default.Gradient).Style
    object.outline_color = object.Outline or Font.Default.Outline
    object.outline_width = object.Outline and 1 or 0
    object.OffsetX = object.OffsetX or Font.Default.OffsetX
    object.OffsetY = object.OffsetY or Font.Default.OffsetY
    return object
end

local function Texture(definition)
    if type(definition) == 'string' then
        return definition
    end

    return T {
        Path = definition.Path,
        Width = definition.Width,
        Height = definition.Height,
    }
end

local Coordinates = T {
    [0] = T { 0, -1 }, --Up
    [1] = T { 1, 0 },  --Right
    [2] = T { 0, 1 },  --Down
    [3] = T { -1, 0 }, --Left
}
local function getPosition(index)
    index = index - 1 --account for 1-based indexing
    local crossbarSide = math.floor(index / FramesPerCrossbar)
    local indexInCrossbar = index % FramesPerCrossbar
    local groupSide = math.floor(indexInCrossbar / FramesPerGroup)
    local indexInGroup = index % FramesPerGroup
    local column, row = table.unpack(Coordinates[indexInGroup])
    return {
        crossbarSide = crossbarSide,
        groupSide = groupSide,
        column = column,
        row = row,
    }
end

local Side = {
    Neither = -1,
    Left = 0,
    Right = 1,
    Both = 3,
}
local function controllerSide(controllerState)
    if controllerState == 1 or controllerState == 5 then
        return Side.Left
    elseif controllerState == 2 or controllerState == 6 then
        return Side.Right
    elseif controllerState == 3 or controllerState == 4 then
        return Side.Both
    else
        return Side.Neither
    end
end

local function setVisible(obj, visible)
    if type(obj.settings) == 'table' and obj.settings.visible ~= nil then
        obj.settings.visible = visible
    else
        obj.visible = visible
    end
end

CaMMOrpg.FrameType = T {
    Circle = "circle",
    Square = "square",
}
function CaMMOrpg:Layout(frameType, crossbars)
    local layout = self:copy(true)
    local isSingle = crossbars == 1
    local frameResRoot = ResRoot .. frameType .. '/'
    local scResRoot = 'skillchains' .. '/'

    local Elements = T {}
    local FixedObjects = T {}
    local Textures = T {}

    local Frame = layout.Frame
    Frame.Texture = 'Frame'
    Frame.Width = Frame.Size
    Frame.Height = Frame.Width
    Frame.OffsetX = 0
    Frame.OffsetY = 0
    Frame.Path = frameResRoot .. 'frame.png'
    Frame.Crossout = frameResRoot .. 'crossout.png'
    Frame.FadeOpacity = 128
    Frame.Trigger = {
        Path = frameResRoot .. 'trigger.png',
        Opacity = 200,
    }
    Textures[Frame.Texture] = Frame
    Textures.Cross = Frame.Crossout
    Textures.Trigger = Frame.Trigger.Path

    local ShiftX = Frame.Width / 30
    local ShiftY = Frame.Height / 30

    local Icon = T {}
    Icon.Width = Frame.Width - ShiftX
    Icon.Height = Frame.Height - ShiftY
    Icon.OffsetX = (Frame.Width - Icon.Width) / 2
    Icon.OffsetY = (Frame.Height - Icon.Height) / 2

    local Group = layout.Group
    Group.Width = Frame.Width * 3
    Group.Height = Frame.Height * 2
    Group.OffsetX = Group.Spacing

    local Crossbar = layout.Crossbar
    Crossbar.Width = GroupsPerCrossbar * Group.Width
        + (GroupsPerCrossbar - 1) * Group.OffsetX
    Crossbar.Height = Group.Height
    Crossbar.OffsetX = Crossbar.Spacing

    local Panel = T {}
    Panel.Width = crossbars * Crossbar.Width
        + (crossbars - 1) * Crossbar.OffsetX
    Panel.Height = Crossbar.Height
    Panel.OffsetX = 0
    Panel.OffsetY = -Frame.Height

    local Skillchains = {
        Framerate = 15,
        Frames = T {
            frameResRoot .. 'crawl1.png',
            frameResRoot .. 'crawl2.png',
            frameResRoot .. 'crawl3.png',
            frameResRoot .. 'crawl4.png',
            frameResRoot .. 'crawl5.png',
            frameResRoot .. 'crawl6.png',
        },
        Icons = T {
            Liquefaction  = scResRoot .. 'Liquefaction.png',
            Scission      = scResRoot .. 'Scission.png',
            Reverberation = scResRoot .. 'Reverberation.png',
            Detonation    = scResRoot .. 'Detonation.png',
            Induration    = scResRoot .. 'Induration.png',
            Impaction     = scResRoot .. 'Impaction.png',
            Transfixion   = scResRoot .. 'Transfixion.png',
            Compression   = scResRoot .. 'Compression.png',
            Fusion        = scResRoot .. 'Fusion.png',
            Gravitation   = scResRoot .. 'Gravitation.png',
            Distortion    = scResRoot .. 'Distortion.png',
            Fragmentation = scResRoot .. 'Fragmentation.png',
            Light         = scResRoot .. 'Light.png',
            Darkness      = scResRoot .. 'Darkness.png',
        }
    }
    for sc, res in pairs(Skillchains.Icons) do
        Textures[sc] = res
    end

    local Name = layout.Name
    Name.OffsetX = Frame.Width / 2
    Name.OffsetY = -Frame.Height * 1.6
    Name.SideSpreadMultiplier = 3
    Name.ColumnSpreadMultiplier = 1
    Name.RowSpreadMultiplier = 1 / 20
    function Name:BeforeRender(index, obj, macroState)
        local position = getPosition(index)
        local heldSide = controllerSide(macroState)

        local visible = heldSide ~= Side.Neither
            and (isSingle or heldSide == position.crossbarSide)
        setVisible(obj, visible)
        if not visible then
            return
        end

        if not self.GroupSideSpreadX
            or self.ColumnSpreadX
            or self.RowSpreadY then
            self.GroupSideSpreadX = self.OffsetX * self.SideSpreadMultiplier
            self.ColumnSpreadX = self.OffsetX * self.ColumnSpreadMultiplier
            self.RowSpreadY = self.OffsetY * self.RowSpreadMultiplier
        end

        if not self.adjustmentCache then
            self.adjustmentCache = T {}
        end

        local adjustment = self.adjustmentCache[index]
        if not adjustment then
            local groupSideMultiplier = position.groupSide == Side.Left and -1 or 1
            local groupSideSpreadX = groupSideMultiplier * (self.GroupSideSpreadX or 0)
            local columnSpreadX = position.column * (self.ColumnSpreadX or 0)
            local rowSpreadY = position.row * (self.RowSpreadY or 0)
            adjustment = {
                self.OffsetX + groupSideSpreadX + columnSpreadX,
                self.OffsetY + rowSpreadY
            }
            self.adjustmentCache[index] = adjustment
        end

        obj.OffsetX = adjustment[1]
        obj.OffsetY = adjustment[2]
    end

    Name.Background.Texture = 'NameBackground'
    Name.Background.Path = ResRoot .. 'name_background.png'
    Name.Background.OffsetX = -Name.Background.Width / 2
    Name.Background.OffsetY = -ShiftY
    Textures[Name.Background.Texture] = Name.Background

    local Hotkey = layout.Hotkey
    Hotkey.OffsetX = ShiftX
    Hotkey.OffsetY = -Hotkey.Size / 4 + ShiftY

    local Recast = layout.Recast
    Recast.OffsetX = Frame.Width / 2
    Recast.OffsetY = Frame.Height / 2 - Recast.Size / 2 - ShiftY

    local Cost = layout.Cost
    Cost.OffsetX = ShiftX / 2
    Cost.OffsetY = Icon.Height - Cost.Size / 2 - ShiftY * 2

    local DragHandle = T {}
    DragHandle.Texture = 'DragHandle'
    DragHandle.Path = ResRoot .. 'drag.png'
    DragHandle.Width = Frame.Width * 3 / 4
    DragHandle.Height = Frame.Height
    DragHandle.OffsetX = Panel.Width
    DragHandle.OffsetY = Panel.Height / 2 - Frame.Height / 2
    Textures[DragHandle.Texture] = DragHandle

    local Label = T {}
    local Palette = layout.Palette
    Label.Size = Palette.Size * 3 / 4

    Label.L2 = T {}
    Label.L2.Texture = 'LabelL2'
    Label.L2.Path = ResRoot .. 'label_l2.png'
    Label.L2.Width = Label.Size * 2.5
    Label.L2.Height = Label.Size
    Label.L2.OffsetX = Crossbar.Width / 2 - Label.L2.Width / 2
    Label.L2.OffsetY = Label.L2.Height / 2
    Label.L2.AssociatedState = 1
    Textures[Label.L2.Texture] = Label.L2

    Label.Set = T {}
    Label.Set.Texture = 'LabelSet'
    Label.Set.Path = ResRoot .. 'label_set.png'
    Label.Set.Width = Label.L2.Width * 1.5
    Label.Set.Height = Label.L2.Height
    Label.Set.OffsetX = Panel.Width / 2 - Label.Set.Width - ShiftX * 2
    Label.Set.OffsetY = Crossbar.Height + Label.Set.Height / 2 + ShiftY * 2
    Textures[Label.Set.Texture] = Label.Set
    FixedObjects:append(Label.Set)

    Palette.OffsetX = Panel.Width / 2 + ShiftX * 2
    Palette.OffsetY = Label.Set.OffsetY - Palette.Size / 3 - ShiftY / 2

    Label.R2 = T {}
    Label.R2.Texture = 'LabelR2'
    Label.R2.Path = ResRoot .. 'label_r2.png'
    Label.R2.Width = Label.L2.Width
    Label.R2.Height = Label.L2.Height
    Label.R2.OffsetX = Crossbar.Width + Label.L2.OffsetX + Crossbar.OffsetX
    Label.R2.OffsetY = Label.L2.OffsetY
    Label.R2.AssociatedState = 2
    Textures[Label.R2.Texture] = Label.R2

    local Divider = T {}
    Divider.Texture = 'Divider'
    Divider.Path = ResRoot .. 'divider.png'
    Divider.Width = ShiftX
    Divider.Height = Frame.Height * 1.2
    Divider.OffsetX = Panel.Width / 2 - Divider.Width / 2
    Divider.OffsetY = Panel.Height / 2 - Divider.Height / 2
    Textures[Divider.Texture] = Divider

    local ActiveSide = T {}
    ActiveSide.Texture = 'ActiveSide'
    ActiveSide.Path = ResRoot .. 'active_side.png'
    ActiveSide.Width = Crossbar.Width + Frame.Width / 2
    ActiveSide.Height = Crossbar.Height + Frame.Height / 2
    ActiveSide.OffsetX = -Frame.Width / 4
    ActiveSide.OffsetY = -Frame.Height / 4
    function ActiveSide:BeforeRender(macroState)
        local heldSide = controllerSide(macroState)
        for _, side in pairs(self.Sides) do
            if side == heldSide then
                setVisible(self, true)
                return
            end
        end
        setVisible(self, false)
    end

    local ActiveSideLeft = ActiveSide:copy()
    ActiveSideLeft.Sides = { Side.Left, Side.Both }
    local ActiveSideRight = ActiveSide:copy()
    ActiveSideRight.Sides = { Side.Right }
    ActiveSideRight.OffsetX = Panel.Width - ActiveSide.Width - ActiveSide.OffsetX

    Textures[ActiveSide.Texture] = ActiveSide
    FixedObjects:append(ActiveSideLeft)
    FixedObjects:append(ActiveSideRight)

    if (not isSingle) then
        FixedObjects:extend(
            T {
                Label.L2,
                Divider,
                Label.R2,
            }
        )
    end

    for i = 1, crossbars * FramesPerGroup * GroupsPerCrossbar, 1 do
        local position = getPosition(i)
        local crossbarSpacing = position.crossbarSide * (Crossbar.Width + Crossbar.OffsetX)
        local groupSpacing = position.groupSide * (Group.Width + Group.OffsetX)

        local columnOffset = (position.column + 1) * Icon.Width
        local rowOffset = (position.row + 1) * Icon.Height / 2
        local rowSpacing = position.row * ShiftY * 4

        local offsetX = columnOffset + groupSpacing + crossbarSpacing
        local offsetY = rowOffset + rowSpacing

        Elements[i] = { OffsetX = offsetX, OffsetY = offsetY }

        FixedObjects:append(T {
            Texture = Name.Background.Texture,
            OffsetX = offsetX + Name.Background.OffsetX,
            OffsetY = offsetY + Name.Background.OffsetY,
            BeforeRender = function(self, macroState)
                if not self.originalOffsetX or not self.originalOffsetY then
                    self.originalOffsetX = self.OffsetX
                    self.originalOffsetY = self.OffsetY
                end
                Name:BeforeRender(i, self, macroState)
                self.OffsetX = self.OffsetX + self.originalOffsetX
                self.OffsetY = self.OffsetY + self.originalOffsetY

                local element = isSingle
                    and gSingleDisplay:GetElementByMacro(macroState, i)
                    or gDoubleDisplay.Elements[i]
                if element and element.State then
                    local name = element.State.Name
                    if type(name) == 'string' and name ~= '' then
                        self.Tint = nil
                    else
                        self.Tint = Color.Black_50
                    end
                end
            end,
        })
    end

    for key, texture in pairs(Textures) do
        Textures[key] = Texture(texture)
    end

    return {
        --Amount is not fixed, you can adjust as desired.
        SkillchainFrames = Skillchains.Frames,

        --Time, in seconds, between frame changes for skillchain animation.
        SkillchainFrameLength = 1 / Skillchains.Framerate,

        --[[
            Textures to be preloaded and sized.
            Can be a string, or a table with Path, Width, and Height entries.
            If using a string, will be sized to match the Width and Height specified for Icon.
        ]] --
        Textures = Textures,

        --Transparency to be used when bound macro's action is not known.  [0-255]
        FadeOpacity = Frame.FadeOpacity,

        --Opacity of the overlay shown when a macro is activated.  [0-255]
        TriggerOpacity = Frame.Trigger.Opacity,

        --Icon to be displayed when draggability is enabled.
        DragHandle = DragHandle,

        --The border of each macro element.  Offsets are relative to the macro element's placement.
        Frame = Frame,

        --The inner icon for each macro element.  Offsets are relative to the macro element's placement.
        Icon = Icon,

        --The text object to display macro or hotkey activation.
        Hotkey = WithDefaults(Hotkey),

        Cost = WithDefaults(Cost),
        Recast = WithDefaults(Recast),
        Name = WithDefaults(Name),

        --Text object to display palette name.  Offsets are relative to entire panel.
        Palette = WithDefaults(Palette),

        --Size of entire panel.  Used for prescreening element clicks and automatic positioning.  Not enforced for rendering.
        Panel = Panel,

        --Texture must be defined in textures table.  Objects are rendered in order, prior to square elements.
        --For double display only, you can specify a macroState (1 = LT, 2 = RT) as AssociatedState to limit the display to that macro state in HalfFull mode.
        FixedObjects = FixedObjects,

        --[[
            Table of element positions.  SingleDisplay has 8 elements, DoubleDisplay has 16.
            Objects are ordered(according to default controller layout):
                1.  Dpad Up(L2)
                2.  Dpad Right(L2)
                3.  Dpad Down(L2)
                4.  Dpad Left(L2)
                5.  Button Up(L2)
                6.  Button Right(L2)
                7.  Button Down(L2)
                8.  Button Left(L2)
                --Only for DoubleDisplay:
                9.  Dpad Up(R2)
                10. Dpad Right(R2)
                11. Dpad Down(R2)
                12. Dpad Left(R2)
                13. Button Up(R2)
                14. Button Right(R2)
                15. Button Down(R2)
                16. Button Left(R2)
        ]]
        --
        Elements = Elements,
    }
end

return CaMMOrpg
