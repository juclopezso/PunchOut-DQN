
previousOpp_health = data.oppHealth
previousMac_health = data.macHealth
prev_oko = data.oppKo
prev_macKo = data.macKo

prev_h10 = data.hearts10
prev_h1 = data.hearts1

function check_reward()
  if data.hearts10 == 0 and data.hearts1 == 0 and data.macHealth < 1 then
      return -0.5
  end

  if data.hearts10 > prev_h10 or data.hearts1 > prev_h1 then
    prev_h10 = data.hearts10
    prev_h1 = data.hearts1
    return 40.0
  end

  if prev_oko < data.oppKo then
    prev_oko = data.oppKo
    return 80
  end
  if prev_macKo < data.macKo then
    prev_macKo = data.macKo
    return -80
  end
  if previousMac_health > data.macHealth then
    local delta = previousMac_health - data.macHealth
    previousMac_health = data.macHealth
    return -delta
  end
  if previousOpp_health > data.oppHealth then
    local delta = previousOpp_health - data.oppHealth
    previousOpp_health = data.oppHealth
    return delta
  end

  if prev_h1 > data.hearts1 then
    local delta = prev_h1 - data.hearts1
    prev_h1 = data.hearts1
    return -10.0
  end

  if data.position > -81.0 and data.position < -76.0 then
    return 0.1
  end

  return 0

end