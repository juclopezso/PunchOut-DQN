
previousMac_health = data.macHealth
function damage_done()
  if previousMac_health > data.macHealth then
    local delta = data.macHealth - previous_healthMac
    previousMac_health = data.macHealth
    return -delta
  else
    return 0
  end
end

previousOpp_health = data.oppHealth
function damage_recieved()
  if previousOpp_health > data.oppHealth then
    local delta = data.oppHealth - previousOpp_health
    previousOpp_health = data.oppHealth
    return delta
  else
    return 0
  end
end

function done_check()
  if data.macKo > 4 then
    return true
  end
  return false
end
