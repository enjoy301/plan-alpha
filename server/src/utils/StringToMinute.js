export const StringToMinute = (time) => {
  let [hour, minute, _] = time.split(":");
  return Number(hour) * 60 + Number(minute);
};

export const StringAddMinute = (time, minute) => {
  let [h, m, _] = time.split(":");
  const totalMinute = Number(h) * 60 + Number(m) + minute;

  const newHour = Math.floor(totalMinute / 60);
  const newMinute = totalMinute % 60;

  return `${newHour}:${newMinute}:00`;
};

export const isCollide = (frontEndTime, backStartTime) => {
  const minute1 = StringToMinute(frontEndTime);
  const minute2 = StringToMinute(backStartTime);

  return minute1 > minute2 ? true : false;
};

// compare to know if two units collide
// by comparing the end time of the first unit and the start time of the second unit
export const isUnitCollide = (unit1, unit2) => {
  if (unit1.endTime > unit2.startTime && unit1.endTime < unit2.endTime) {
    return true;
  } else if (
    unit1.startTime > unit2.startTime &&
    unit1.startTime < unit2.endTime
  ) {
    return true;
  }
  return false;
};

export const UnitInsert = (result, unit) => {
  let newResult = result;
  let i = 0;
  for (; i < result.schedule.length; i++) {
    if (result.schedule[i].startTime >= unit.endTime) {
      break;
    }
  }

  newResult.schedule.splice(i, 0, unit);

  return newResult;
};
