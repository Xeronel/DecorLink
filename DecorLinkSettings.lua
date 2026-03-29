DecorLinkSettings = {};
DecorLinkSettings["none"] = function() return true end;
DecorLinkSettings["ctrl"] = IsControlKeyDown;
DecorLinkSettings["alt"] = IsAltKeyDown;
DecorLinkSettings["shift"] = IsShiftKeyDown;
DecorLink_SavedVars = {};
local addonName = "DecorLink";

EventUtil.ContinueOnAddOnLoaded(addonName, function()
	-- Add Category to options panel
	local category, layout = Settings.RegisterVerticalLayoutCategory(addonName);

	do
		--
		-- Add Modifier Keys option
		--
		local variable = "modifierKey";
		local name = "Modifier Key";
		local defaultValue = "ctrl";
		-- This will read/write the setting directly to DecorLink_SavedVars
		local setting = Settings.RegisterAddOnSetting(category, addonName.."_"..variable, variable, DecorLink_SavedVars, "string", name, defaultValue);

		local container = Settings.CreateControlTextContainer();
		container:Add("none", "None", "No Modifier Key");
		container:Add("ctrl", "Ctrl", "Ctrl Key");
		container:Add("alt", "Alt", "Alt Key");
		container:Add("shift", "Shift", "Shift Key");
		Settings.CreateDropdown(category, setting, function() return container:GetData() end, name);
	end

	do
		--
		-- Add Mouse Key option
		--
		local variable = "mouseButton";
		local name = "Mouse Button";
		local defaultValue = "left";
		-- This will read/write the setting directly to DecorLink_SavedVars
		local setting = Settings.RegisterAddOnSetting(category, addonName.."_"..variable, variable, DecorLink_SavedVars, "string", name, defaultValue);

		local container = Settings.CreateControlTextContainer();
		container:Add("LeftButton", "Left Click", "Left Click");
		container:Add("RightButton", "Right Click", "Right Click");
		Settings.CreateDropdown(category, setting, function() return container:GetData() end, name);
	end
	Settings.RegisterAddOnCategory(category);
end);

function DecorLinkSettings.IsKeyDown()
	local setting = Settings.GetSetting("DecorLink_modifierKey");
	local modifierKey = setting:GetValue();
	return DecorLinkSettings[modifierKey]();
end

function DecorLinkSettings.Clicked(button)
	local setting = Settings.GetSetting("DecorLink_mouseButton");
	local mouseButton = setting:GetValue();
	return button == mouseButton;
end
