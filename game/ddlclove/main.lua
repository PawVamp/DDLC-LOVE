function main_update()
	getTime = getTime + dt
	--moving background
	posX = posX - 0.625
	posY = posY - 0.625
	if posX <= -200 then posX = 0 end
	if posY <= -200 then posY = 0 end
	
	--custom audio looping
	if audio_bgm and audio_bgmloop then
		if not audio_bgm:isPlaying() and not audio_bgmloop:isPlaying() then
			audio_bgmloop:play()
		end
	end
end

function game_setvolume()
	if not settings.masvol or not settings.bgmvol or not settings.sfxvol then
		settings.masvol = 70
		settings.bgmvol = 70
		settings.sfxvol = 70
	end
	
	local masvol = settings.masvol/100
	local bgmvol = (settings.bgmvol/100)*masvol
	local sfxvol = (settings.sfxvol/100)*masvol
	if dvertype == '' then
		if audio_bgm then
			audio_bgm:setVolume(bgmvol)
		end
		if audio_bgmloop then
			audio_bgmloop:setVolume(bgmvol)
		end
		sfx1:setVolume(sfxvol)
		sfx2:setVolume(sfxvol)
	end
end

function love.errorhandler(msg)
	msg = debug.traceback("Error: " .. tostring(msg))
	love.filesystem.write("error.txt",msg)
end
