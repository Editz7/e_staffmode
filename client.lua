CreateThread(function()
    while true do
        Wait(0)
        if LocalPlayer.state.staffmode then
            SetPlayerInvincible(PlayerId(), true)
        end
    end
end)
