DecorLinkMixin = {};

EventRegistry:RegisterCallback("HousingCatalogEntry.OnInteract", function(owner, catalogEntry, button, isDrag)
    local keyDown = DecorLinkSettings.IsKeyDown();
    local clicked = DecorLinkSettings.Clicked(button);
    if clicked and keyDown then
        local catalogEntryInfo = C_HousingCatalog.GetCatalogEntryInfo(catalogEntry.entryInfo.entryID);
        if catalogEntryInfo ~= nil and catalogEntryInfo.itemID ~= nil then
            local itemObj = Item:CreateFromItemID(catalogEntryInfo.itemID);
            itemObj:ContinueOnItemLoad(function()
                ChatEdit_InsertLink(itemObj:GetItemLink());
            end)
        end
    end
end, "DecorLinkMixin");
