
previousOpp_health = data.oppHealth
previousMac_health = data.macHealth
prev_oko = data.oppKo
prev_macKo = data.macKo

prev_h10 = data.hearts10
prev_h1 = data.hearts1

function check_reward()
  if data.hearts10 == 0 and data.hearts1 == 0 and data.macHealth > 0 then
      return -0.3
  end

  if data.hearts10 > prev_h10 or data.hearts1 > prev_h1 then
    prev_h10 = data.hearts10
    prev_h1 = data.hearts1
    return 12.0
  end

  if prev_oko < data.oppKo then
    prev_oko = data.oppKo
    return 60
  end
  if prev_macKo < data.macKo then
    prev_macKo = data.macKo
    return -60
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

  return 0
end