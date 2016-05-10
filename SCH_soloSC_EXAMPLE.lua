function get_sets()
  -- Load and initialize the include file.
  mote_include_version = 2
  include('Mote-Include.lua')
  include('common_info.skillchain.lua')
  include('SCH_soloSC.lua')
end


function job_setup()

end

function file_unload()
  if binds_on_unload then
    binds_on_unload()
  end
end

function user_setup()

end

function user_unload()

end

function init_gear_sets()
end

function errlog(msg) 
	add_to_chat(167,msg)
end

function job_self_command(cmdParams, eventArgs)
-- maybe some other stuff
  if cmdParams[1] == 'soloSC' then
    if not cmdParams[2] or not cmdParams[3] then
      errlog('missing required parameters for function soloSkillchain')
      return
    else
      soloSkillchain(cmdParams[2],cmdParams[3],cmdParams[4])
    end
  end
-- maybe some other stuff
end


--------------------------------------
-- GET NB STRATAGEMS
--------------------------------------
-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
-- Source : SCH file found in https://github.com/Kinematics/GearSwap-Jobs
function getNbStratagems()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]
    local maxStrategems = math.floor((player.main_job_level + 10) / 20)
    local fullRechargeTime = 4*60
    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
    return currentCharges
end

--------------------------------------
-- ERRLOG
--------------------------------------
function errlog(msg) 
	add_to_chat(167,msg)
end