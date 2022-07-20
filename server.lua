local DISCORD_URL<const> = 'CHANGE ME'

local function Notify(title, message, target)
    TriggerClientEvent('chat:addMessage', target,{
        color = { 255, 0, 0},
        multiline = true,
        args = {title, message}
    })
end

local function Log(embed)
    PerformHttpRequest(DISCORD_URL, function(err, text, headers) end, 'POST', json.encode({username = 'Staff Mode', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

local function ToggleStaff(source)
    if not IsPlayerAceAllowed(source, 'editz.staffmode') then return end
    local player = Player(source)
    if not player.state.staffmode then
        player.state.staffmode = true
        Log({
            {
                ['title'] = '**'.. GetPlayerName(source) ..'** entered staff mode',
                ['description'] = '**'.. GetPlayerName(source) ..'** entered staff mode'
            }
        })
        Notify('Staff Mode', 'You have entered staff mode', source)
          
    else
        player.state.staffmode = false
        Log({
            {
                ['title'] = '**'.. GetPlayerName(source) ..'** left staff mode',
                ['description'] = '**'.. GetPlayerName(source) ..'** left staff mode'
            }
        })
        Notify('Staff Mode', 'You have left staff mode', source)
    end
end

RegisterCommand('staffmode', ToggleStaff)
RegisterCommand('togglestaff', ToggleStaff)


exports('togglestaff', ToggleStaff)
