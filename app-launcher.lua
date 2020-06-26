local appCuts = {
  d = 'EuDic',
  e = 'Emacs',
  f = 'Finder',
  i = 'IntelliJ Idea',
  k = 'Google chrome',
  m = 'Mail',
  s = 'emacs'
}

local function init_app_binding()
	for key, app in pairs(appCuts) do
	  hs.hotkey.bind({"ctrl", "shift"}, key, function () hs.application.launchOrFocus(app) end)
	end
end

init_app_binding()
