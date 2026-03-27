local f = CreateFrame("Frame");

EventRegistry:RegisterCallback("HousingCatalogEntry.OnInteract", function(owner, catalogEntry, button, isDrag)
    if button == "LeftButton" and not isDrag then
        if IsControlKeyDown() then
            local catalogEntryInfo = C_HousingCatalog.GetCatalogEntryInfo(catalogEntry.entryInfo.entryID);
            if catalogEntryInfo.itemID ~= nil then
                local _, itemLink = GetItemInfo(catalogEntryInfo.itemID);
                if itemLink ~= nil then
                    ChatEdit_InsertLink(itemLink);
                end
            end
        end
    end
end, f);