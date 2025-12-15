local total_secs = 0

local is_ticking = false

local function secs_to_hhmmss(total_secs)
    local secs = total_secs % 60
    local mins = math.floor(total_secs / 60) % 60
    local hours = math.floor(total_secs / 3600)

    return string.format("%02d:%02d:%02d", hours, mins, secs)
end

local function on_timer_ui_close()
    dialog_timer:stop()
end

local timer_ui = Dialog({
    title = secs_to_hhmmss(total_secs),
    on_close = on_timer_ui_close
})

local function time_update()
    timer_ui:modify({
        title = secs_to_hhmmss(total_secs)
    })

end

local dialog_timer = Timer{
    interval = 1.0,

    ontick = function()
        total_secs = total_secs + 1
        time_update()
    end 
}

local function on_play_btn_pressed()
    is_ticking = not is_ticking

    if is_ticking then
        timer_ui:modify({
            id = "toggle_btn",
            text = "||"
        })
        dialog_timer:start()
    else
        timer_ui:modify({
            id = "toggle_btn",
            text = ">"
        })
        dialog_timer:stop()
    end
end

local function on_reset_btn_pressed()
    is_ticking = false
    dialog_timer:stop()
    total_secs = 0
    time_update()
end

timer_ui:button({
    id = "toggle_btn",
    text = ">",
    focus = true,
    onclick = on_play_btn_pressed
})

timer_ui:button({
    id = "reset_btn",
    text = "0",
    onclick = on_reset_btn_pressed
})

timer_ui:show({ wait = false })
