local scale = 1.4;

local fontHeight = math.floor(11 * scale);
local fontOutline, fontSize;
if (fontHeight < 10) then
    fontOutline = 1;
    fontSize = (fontHeight - 1);
else
    fontOutline = 2;
    fontSize = (fontHeight - 2);
end

local padding = math.floor(5 * scale);
local frame = math.floor(2 * scale);
local square = math.floor(40 * scale);
local spacing = math.floor(12 * scale);

local objWidth = square + (2 * (padding + frame));
local objHeight = square + (2 * frame) + fontHeight;

local verticalOffset1 = square;
local verticalOffset2 = verticalOffset1 + square + (2 * frame);
local panelHeight = verticalOffset2 + objHeight;

local theme = {};
theme.CrossPath = 'misc/cross.png';
theme.TriggerPath = 'misc/trigger.png';
theme.SkillchainAnimationPaths = T{};
theme.SkillchainAnimationPaths[1] = 'misc/crawl1.png';
theme.SkillchainAnimationPaths[2] = 'misc/crawl2.png';
theme.SkillchainAnimationPaths[3] = 'misc/crawl3.png';
theme.SkillchainAnimationPaths[4] = 'misc/crawl4.png';
theme.SkillchainAnimationPaths[5] = 'misc/crawl5.png';
theme.SkillchainAnimationPaths[6] = 'misc/crawl6.png';
theme.SkillchainAnimationPaths[7] = 'misc/crawl7.png';
theme.SkillchainAnimationTime = 0.08;
theme.IconFadeAlpha = 0.5;
theme.SingleDisplay = {};
theme.SingleDisplay.FontObjects = {};
theme.SingleDisplay.FontObjects.Cost = {};
theme.SingleDisplay.FontObjects.Cost.BoxWidth = square;
theme.SingleDisplay.FontObjects.Cost.BoxHeight = fontHeight;
theme.SingleDisplay.FontObjects.Cost.OffsetX = padding + frame;
theme.SingleDisplay.FontObjects.Cost.OffsetY = (frame + square) - fontHeight;
theme.SingleDisplay.FontObjects.Cost.OutlineWidth = fontOutline;
theme.SingleDisplay.FontObjects.Cost.FontHeight = fontSize;
theme.SingleDisplay.FontObjects.Cost.FontFamily = 'Arial';
theme.SingleDisplay.FontObjects.Cost.FontFlags = 0;
theme.SingleDisplay.FontObjects.Cost.FontAlignment = 2;
theme.SingleDisplay.FontObjects.Cost.FontColor = 0xFF389609;
theme.SingleDisplay.FontObjects.Cost.OutlineColor = 0xFF000000;
theme.SingleDisplay.FontObjects.Macro = {};
theme.SingleDisplay.FontObjects.Macro.BoxWidth = square;
theme.SingleDisplay.FontObjects.Macro.BoxHeight = fontHeight;
theme.SingleDisplay.FontObjects.Macro.OffsetX = padding + frame;
theme.SingleDisplay.FontObjects.Macro.OffsetY = frame;
theme.SingleDisplay.FontObjects.Macro.OutlineWidth = fontOutline;
theme.SingleDisplay.FontObjects.Macro.FontHeight = fontSize;
theme.SingleDisplay.FontObjects.Macro.FontFamily = 'Arial';
theme.SingleDisplay.FontObjects.Macro.FontFlags = 0;
theme.SingleDisplay.FontObjects.Macro.FontAlignment = 0;
theme.SingleDisplay.FontObjects.Macro.FontColor = 0xFFFFFFFF;
theme.SingleDisplay.FontObjects.Macro.OutlineColor = 0xFF000000;
theme.SingleDisplay.FontObjects.Name = {};
theme.SingleDisplay.FontObjects.Name.BoxWidth = square + ((padding + frame) * 2);
theme.SingleDisplay.FontObjects.Name.BoxHeight = fontHeight;
theme.SingleDisplay.FontObjects.Name.OffsetX = 0;
theme.SingleDisplay.FontObjects.Name.OffsetY = (2 * frame) + square;
theme.SingleDisplay.FontObjects.Name.OutlineWidth = fontOutline;
theme.SingleDisplay.FontObjects.Name.FontHeight = fontSize;
theme.SingleDisplay.FontObjects.Name.FontFamily = 'Arial';
theme.SingleDisplay.FontObjects.Name.FontFlags = 0;
theme.SingleDisplay.FontObjects.Name.FontAlignment = 1;
theme.SingleDisplay.FontObjects.Name.FontColor = 0xFFFFFFFF;
theme.SingleDisplay.FontObjects.Name.OutlineColor = 0xFF000000;
theme.SingleDisplay.FontObjects.Recast = {};
theme.SingleDisplay.FontObjects.Recast.BoxWidth = square;
theme.SingleDisplay.FontObjects.Recast.BoxHeight = fontHeight;
theme.SingleDisplay.FontObjects.Recast.OffsetX = padding + frame;
theme.SingleDisplay.FontObjects.Recast.OffsetY = (frame + square) - fontHeight;
theme.SingleDisplay.FontObjects.Recast.OutlineWidth = fontOutline;
theme.SingleDisplay.FontObjects.Recast.FontHeight = fontSize;
theme.SingleDisplay.FontObjects.Recast.FontFamily = 'Arial';
theme.SingleDisplay.FontObjects.Recast.FontFlags = 0;
theme.SingleDisplay.FontObjects.Recast.FontAlignment = 0;
theme.SingleDisplay.FontObjects.Recast.FontColor = 0xFF389609;
theme.SingleDisplay.FontObjects.Recast.OutlineColor = 0xFF000000;
theme.SingleDisplay.ImageObjects = {};
theme.SingleDisplay.ImageObjects.Frame = {};
theme.SingleDisplay.ImageObjects.Frame.OffsetX = padding;
theme.SingleDisplay.ImageObjects.Frame.OffsetY = 0;
theme.SingleDisplay.ImageObjects.Frame.Width = square + (2 * frame);
theme.SingleDisplay.ImageObjects.Frame.Height = square + (2 * frame);
theme.SingleDisplay.ImageObjects.Icon = {};
theme.SingleDisplay.ImageObjects.Icon.OffsetX = padding + frame;
theme.SingleDisplay.ImageObjects.Icon.OffsetY = frame;
theme.SingleDisplay.ImageObjects.Icon.Width = square;
theme.SingleDisplay.ImageObjects.Icon.Height = square;
theme.SingleDisplay.ImageObjects.Overlay = {};
theme.SingleDisplay.ImageObjects.Overlay.OffsetX = padding + frame;
theme.SingleDisplay.ImageObjects.Overlay.OffsetY = frame;
theme.SingleDisplay.ImageObjects.Overlay.Width = square;
theme.SingleDisplay.ImageObjects.Overlay.Height = square;
theme.SingleDisplay.Primitives = T{};
theme.SingleDisplay.FramePath = 'misc/frame.png';
theme.SingleDisplay.PanelHeight = panelHeight;
theme.SingleDisplay.PanelWidth = (6 * objWidth) + 8 + spacing;
theme.SingleDisplay.DefaultX = 0;
theme.SingleDisplay.DefaultY = 0;
theme.SingleDisplay.SquareHeight = objHeight;
theme.SingleDisplay.SquareWidth = objWidth;
theme.SingleDisplay.Squares = T{};
theme.SingleDisplay.Squares[1] = { OffsetX = objWidth + 2, OffsetY = 0 };
theme.SingleDisplay.Squares[2] = { OffsetX = (2 * objWidth) + 4, OffsetY = verticalOffset1 };
theme.SingleDisplay.Squares[3] = { OffsetX = objWidth + 2, OffsetY = verticalOffset2 };
theme.SingleDisplay.Squares[4] = { OffsetX = 0, OffsetY = verticalOffset1 };
local offset = (objWidth * 3) + 4 + spacing;
theme.SingleDisplay.Squares[5] = { OffsetX = offset + objWidth + 2, OffsetY = 0 };
theme.SingleDisplay.Squares[6] = { OffsetX = offset + (2 * objWidth) + 4, OffsetY = verticalOffset1 };
theme.SingleDisplay.Squares[7] = { OffsetX = offset + objWidth + 2, OffsetY = verticalOffset2 };
theme.SingleDisplay.Squares[8] = { OffsetX = offset, OffsetY = verticalOffset1 };
theme.DoubleDisplay = {};
theme.DoubleDisplay.FontObjects = {};
theme.DoubleDisplay.FontObjects.Cost = {};
theme.DoubleDisplay.FontObjects.Cost.BoxWidth = square;
theme.DoubleDisplay.FontObjects.Cost.BoxHeight = fontHeight;
theme.DoubleDisplay.FontObjects.Cost.OffsetX = padding + frame;
theme.DoubleDisplay.FontObjects.Cost.OffsetY = (frame + square) - fontHeight;
theme.DoubleDisplay.FontObjects.Cost.OutlineWidth = fontOutline;
theme.DoubleDisplay.FontObjects.Cost.FontHeight = fontSize;
theme.DoubleDisplay.FontObjects.Cost.FontFamily = 'Arial';
theme.DoubleDisplay.FontObjects.Cost.FontFlags = 0;
theme.DoubleDisplay.FontObjects.Cost.FontAlignment = 2;
theme.DoubleDisplay.FontObjects.Cost.FontColor = 0xFF389609;
theme.DoubleDisplay.FontObjects.Cost.OutlineColor = 0xFF000000;
theme.DoubleDisplay.FontObjects.Macro = {};
theme.DoubleDisplay.FontObjects.Macro.BoxWidth = square;
theme.DoubleDisplay.FontObjects.Macro.BoxHeight = fontHeight;
theme.DoubleDisplay.FontObjects.Macro.OffsetX = padding + frame;
theme.DoubleDisplay.FontObjects.Macro.OffsetY = frame;
theme.DoubleDisplay.FontObjects.Macro.OutlineWidth = fontOutline;
theme.DoubleDisplay.FontObjects.Macro.FontHeight = fontSize;
theme.DoubleDisplay.FontObjects.Macro.FontFamily = 'Arial';
theme.DoubleDisplay.FontObjects.Macro.FontFlags = 0;
theme.DoubleDisplay.FontObjects.Macro.FontAlignment = 0;
theme.DoubleDisplay.FontObjects.Macro.FontColor = 0xFFFFFFFF;
theme.DoubleDisplay.FontObjects.Macro.OutlineColor = 0xFF000000;
theme.DoubleDisplay.FontObjects.Name = {};
theme.DoubleDisplay.FontObjects.Name.BoxWidth = square + ((padding + frame) * 2);
theme.DoubleDisplay.FontObjects.Name.BoxHeight = fontHeight;
theme.DoubleDisplay.FontObjects.Name.OffsetX = 0;
theme.DoubleDisplay.FontObjects.Name.OffsetY = (2 * frame) + square;
theme.DoubleDisplay.FontObjects.Name.OutlineWidth = fontOutline;
theme.DoubleDisplay.FontObjects.Name.FontHeight = fontSize;
theme.DoubleDisplay.FontObjects.Name.FontFamily = 'Arial';
theme.DoubleDisplay.FontObjects.Name.FontFlags = 0;
theme.DoubleDisplay.FontObjects.Name.FontAlignment = 1;
theme.DoubleDisplay.FontObjects.Name.FontColor = 0xFFFFFFFF;
theme.DoubleDisplay.FontObjects.Name.OutlineColor = 0xFF000000;
theme.DoubleDisplay.FontObjects.Recast = {};
theme.DoubleDisplay.FontObjects.Recast.BoxWidth = square;
theme.DoubleDisplay.FontObjects.Recast.BoxHeight = fontHeight;
theme.DoubleDisplay.FontObjects.Recast.OffsetX = padding + frame;
theme.DoubleDisplay.FontObjects.Recast.OffsetY = (frame + square) - fontHeight;
theme.DoubleDisplay.FontObjects.Recast.OutlineWidth = fontOutline;
theme.DoubleDisplay.FontObjects.Recast.FontHeight = fontSize;
theme.DoubleDisplay.FontObjects.Recast.FontFamily = 'Arial';
theme.DoubleDisplay.FontObjects.Recast.FontFlags = 0;
theme.DoubleDisplay.FontObjects.Recast.FontAlignment = 0;
theme.DoubleDisplay.FontObjects.Recast.FontColor = 0xFF389609;
theme.DoubleDisplay.FontObjects.Recast.OutlineColor = 0xFF000000;
theme.DoubleDisplay.ImageObjects = {};
theme.DoubleDisplay.ImageObjects.Frame = {};
theme.DoubleDisplay.ImageObjects.Frame.OffsetX = padding;
theme.DoubleDisplay.ImageObjects.Frame.OffsetY = 0;
theme.DoubleDisplay.ImageObjects.Frame.Width = square + (2 * frame);
theme.DoubleDisplay.ImageObjects.Frame.Height = square + (2 * frame);
theme.DoubleDisplay.ImageObjects.Icon = {};
theme.DoubleDisplay.ImageObjects.Icon.OffsetX = padding + frame;
theme.DoubleDisplay.ImageObjects.Icon.OffsetY = frame;
theme.DoubleDisplay.ImageObjects.Icon.Width = square;
theme.DoubleDisplay.ImageObjects.Icon.Height = square;
theme.DoubleDisplay.ImageObjects.Overlay = {};
theme.DoubleDisplay.ImageObjects.Overlay.OffsetX = padding + frame;
theme.DoubleDisplay.ImageObjects.Overlay.OffsetY = frame;
theme.DoubleDisplay.ImageObjects.Overlay.Width = square;
theme.DoubleDisplay.ImageObjects.Overlay.Height = square;
theme.DoubleDisplay.Primitives = T{};
theme.DoubleDisplay.FramePath = 'misc/frame.png';
theme.DoubleDisplay.PanelHeight = panelHeight;
theme.DoubleDisplay.PanelWidth = (12 * objWidth) + (5 * spacing) + 16;
theme.DoubleDisplay.DefaultX = 0;
theme.DoubleDisplay.DefaultY = 0;
theme.DoubleDisplay.SquareHeight = objHeight;
theme.DoubleDisplay.SquareWidth = objWidth;
theme.DoubleDisplay.Squares = T{};
theme.DoubleDisplay.Squares[1] = { OffsetX = objWidth + 2, OffsetY = 0 };
theme.DoubleDisplay.Squares[2] = { OffsetX = (2 * objWidth) + 4, OffsetY = verticalOffset1 };
theme.DoubleDisplay.Squares[3] = { OffsetX = objWidth + 2, OffsetY = verticalOffset2 };
theme.DoubleDisplay.Squares[4] = { OffsetX = 0, OffsetY = verticalOffset1 };
offset = (objWidth * 3) + 4 + spacing;
theme.DoubleDisplay.Squares[5] = { OffsetX = offset + objWidth + 2, OffsetY = 0 };
theme.DoubleDisplay.Squares[6] = { OffsetX = offset + (2 * objWidth) + 4, OffsetY = verticalOffset1 };
theme.DoubleDisplay.Squares[7] = { OffsetX = offset + objWidth + 2, OffsetY = verticalOffset2 };
theme.DoubleDisplay.Squares[8] = { OffsetX = offset, OffsetY = verticalOffset1 };
offset = offset + (3 * objWidth) + 4 + (3 * spacing);
theme.DoubleDisplay.Squares[9] = { OffsetX = offset + objWidth + 2, OffsetY = 0 };
theme.DoubleDisplay.Squares[10] = { OffsetX = offset + (2 * objWidth) + 4, OffsetY = verticalOffset1 };
theme.DoubleDisplay.Squares[11] = { OffsetX = offset + objWidth + 2, OffsetY = verticalOffset2 };
theme.DoubleDisplay.Squares[12] = { OffsetX = offset, OffsetY = verticalOffset1 };
offset = offset + (3 * objWidth) + 4 + spacing;
theme.DoubleDisplay.Squares[13] = { OffsetX = offset + objWidth + 2, OffsetY = 0 };
theme.DoubleDisplay.Squares[14] = { OffsetX = offset + (2 * objWidth) + 4, OffsetY = verticalOffset1 };
theme.DoubleDisplay.Squares[15] = { OffsetX = offset + objWidth + 2, OffsetY = verticalOffset2 };
theme.DoubleDisplay.Squares[16] = { OffsetX = offset, OffsetY = verticalOffset1 };

local scaling = require('scaling');
if ((scaling.window.w == -1) or (scaling.window.h == -1) or (scaling.menu.w == -1) or (scaling.menu.h == -1)) then
    theme.SingleDisplay.DefaultX = 0;
    theme.SingleDisplay.DefaultY = 0;
    theme.DoubleDisplay.DefaultX = 0;
    theme.DoubleDisplay.DefaultY = 0;
else
    theme.SingleDisplay.DefaultX = (scaling.window.w - theme.SingleDisplay.PanelWidth) / 2;
    theme.SingleDisplay.DefaultY = scaling.window.h - (scaling.scale_height(136) + theme.SingleDisplay.PanelHeight);
    theme.DoubleDisplay.DefaultX = (scaling.window.w - theme.DoubleDisplay.PanelWidth) / 2;
    theme.DoubleDisplay.DefaultY = scaling.window.h - (scaling.scale_height(136) + theme.DoubleDisplay.PanelHeight);
end

return theme;