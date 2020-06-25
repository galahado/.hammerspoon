local wm = require('window-management')
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind({"alt", "cmd"}, {
  left = wm.throwLeft,
  right = wm.throwRight,
  f = wm.maximizeWindow,    -- ⌃⌥⌘ + M
  c = wm.centerOnScreen,
  h = wm.leftHalf,       -- ⌃⌥⌘ + ←
  l = wm.rightHalf,     -- ⌃⌥⌘ + →
  k = wm.topHalf,          -- ⌃⌥⌘ + ↑
  j = wm.bottomHalf,      -- ⌃⌥⌘ + ↓c = wm.centerOnScreen,    -- ⌃⌥⌘ + C
  y = wm.leftTopHalf,
  n = wm.leftBottomHalf,
  u = wm.rightTopHalf,
  m = wm.rightBottomHalf
})

hk.bind({"alt", "cmd"}, ",", wm.rightToLeft)
hk.bind({"alt", "cmd"}, ".", wm.rightToRight)
hk.bind({"alt", "cmd"}, "p", wm.leftToLeft)
hk.bind({"alt", "cmd"}, "[", wm.leftToRight)

-- change focus
hs.hotkey.bind({"cmd", "ctrl"}, 'H', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind({"cmd", "ctrl"}, 'L', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind({"cmd", "ctrl"}, 'K', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind({"cmd", "ctrl"}, 'J', function() hs.window.focusedWindow():focusWindowSouth() end)

-- * Windows-like cycle
windowBind({"ctrl", "alt", "cmd"}, {
  u = wm.cycleLeft,          -- ⌃⌥⌘ + u
  i = wm.cycleRight          -- ⌃⌥⌘ + i
})
