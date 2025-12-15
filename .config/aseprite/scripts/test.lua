local dlg = Dialog()
dlg:entry{ id="user_value", label="User Value:", text="Default User" }
dlg:button{ id="confirm", text="Confirm" }
dlg:button{ id="cancel", text="Cancel" }
dlg:show()
local data = dlg.data

if data.confirm then
    local img = app.image
    img:clear()
end

