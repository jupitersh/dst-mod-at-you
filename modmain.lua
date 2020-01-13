if not (GLOBAL.TheNet and GLOBAL.TheNet:GetIsServer()) then return end

local repeat_times = GetModConfigData("repeat_times")

local _Networking_Say = GLOBAL.Networking_Say

GLOBAL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, isemote, ...)
    _Networking_Say(guid, userid, name, prefab, message, colour, whisper, isemote, ...)
    if not whisper then
        if string.sub(message, 1, 1) == "@" and string.find(message, "#") then
            local _, jinghao = string.find(message, "#")
            if string.len(message) > jinghao and jinghao >= 3 then
                local player = string.sub(message, 2, jinghao-1)
                local message_part = string.sub(message, jinghao+1, -1)
                local name = name
                for i, v in ipairs(GLOBAL.AllPlayers) do
                    if string.find(v.name, player) then
                        v:DoTaskInTime(0,function(player)
                            local function stop(player, count)
                                if player.talktask ~= nil and count >= repeat_times then
                                    player.talktask:Cancel()
                                    player.talktask = nil
                                end
                            end
                            local count = 0
                            player.talktask = player:DoPeriodicTask(3, function(player)
                                player.components.talker:Say(name..": "..message_part)
                                count = count + 1
                                stop(player, count)
                            end)
                        end)
                    end
                end
            end
        end
    end
end