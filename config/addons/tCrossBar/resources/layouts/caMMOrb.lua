-- A layout with circular frames
-- See caMMOrpg/style.lua for styling and caMMOrpg/layout.lua for implementation
-------------------------------------------------
---@diagnostic disable: undefined-global
ResRoot = 'caMMOrpg' .. '/'
-- GetResourcePath should exist because that's how /this/ file is loaded
-- Functions exist in the main file, need to load it
local caMMOrpg = dofile(GetResourcePath(ResRoot .. 'layout.lua'))
return {
    Double = caMMOrpg:Layout(caMMOrpg.FrameType.Circle, 2),
    Single = caMMOrpg:Layout(caMMOrpg.FrameType.Circle, 1),
}
