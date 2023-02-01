import moment from "moment";
import {
  isCollide,
  isUnitCollide,
  MinuteToString,
  StringAddMinute,
  StringToMinute,
  UnitInsert,
} from "./StringToMinute";

const FillEmpty = (result) => {
  let beforeTime = "00:00:00";
  let emptyArray = [];
  const leng = result.schedule.length;

  for (let i = 0; i < result.schedule.length; i++) {
    if (result.schedule[i].startTime !== beforeTime) {
      emptyArray.push({
        title: "empty",
        category: "empty",
        startTime: beforeTime,
        endTime: result.schedule[i].startTime,
      });
    }
    beforeTime = result.schedule[i].endTime;
  }

  if (result.schedule[leng - 1].endTime !== "24:00:00") {
    emptyArray.push({
      title: "empty",
      category: "empty",
      startTime: result.schedule[leng - 1].endTime,
      endTime: "24:00:00",
    });
  }

  let newResult = {
    schedule: [],
  };
  let i = 0;
  let j = 0;
  while (i < result.schedule.length && j < emptyArray.length) {
    if (
      StringToMinute(result.schedule[i].startTime) <
      StringToMinute(emptyArray[j].startTime)
    ) {
      newResult.schedule.push(result.schedule[i]);
      console.log(result.schedule[i]);
      i++;
    } else {
      console.log(emptyArray[j]);
      newResult.schedule.push(emptyArray[j]);
      j++;
    }
  }
  if (i !== result.schedule.length) {
    newResult.schedule.push(result.schedule[result.schedule.length - 1]);
  } else {
    newResult.schedule.push(emptyArray[emptyArray.length - 1]);
  }

  return newResult;
};

const isAllOk = (result, unit) => {
  result.schedule.map((item) => {
    if (isUnitCollide(item, unit)) {
      return false;
    }
  });

  return true;
};

const Collocator = (result, unit) => {
  while (StringToMinute(unit.endTime) <= 1440) {
    if (isAllOk(result, unit)) {
      result = UnitInsert(result, unit);
      return result;
    } else {
      unit.startTime = StringAddMinute(unit.startTime, 30);
      unit.endTime = StringAddMinute(unit.endTime, 30);
    }
  }

  return result;
};

const BadCalculation = (schedules) => {
  let sleepLess6 = 0;
  let sleepMore8 = 0;
  let workoutCount = 0;
  let hackTotalMinute = 0;

  schedules.map((schedule) => {
    schedule.schedule.map((item) => {
      // sleep일 때
      if (item.category === "sleep") {
        // 6시간 미만 계산
        if (
          moment
            .duration(
              moment(item.endTime, "HH:mm").diff(
                moment(item.startTime, "HH:mm")
              )
            )
            .hours() < 6
        ) {
          sleepLess6++;
        }
        // 8시간 초과 계산
        if (
          moment
            .duration(
              moment(item.endTime, "HH:mm").diff(
                moment(item.startTime, "HH:mm")
              )
            )
            .hours() > 8
        ) {
          sleepMore8++;
        }
      } else if (item.category === "workout") {
        workoutCount++;
      } else if (item.category === "hack") {
        hackTotalMinute +=
          StringToMinute(item.endTime) - StringToMinute(item.startTime);
      }
    });
  });

  return {
    isSleepLess: sleepLess6 >= 3 ? true : false,
    isSleepMore: sleepMore8 >= 3 ? true : false,
    isWorkoutLess: workoutCount < 2 ? true : false,
    isHackLess5: hackTotalMinute < 300 ? true : false,
    isHackMore20: hackTotalMinute > 1200 ? true : false,
  };
};

const SleepUnitAlgorithm = (specialDateSchedule, result, Bads) => {
  let sleepUnit = {};

  specialDateSchedule.schedule.map((item) => {
    if (item.category === "sleep") {
      sleepUnit = item;
    }
  });

  if (Bads.isSleepLess) {
    if (
      StringToMinute(sleepUnit.endTime) - StringToMinute(sleepUnit.startTime) <
      360
    ) {
      sleepUnit.endTime = StringAddMinute(sleepUnit.startTime, 360);
    }
  } else if (Bads.isSleepMore) {
    if (
      StringToMinute(sleepUnit.endTime) - StringToMinute(sleepUnit.startTime) >
      480
    ) {
      sleepUnit.endTime = StringAddMinute(sleepUnit.startTime, 480);
    }
  }
  result.schedule.push(sleepUnit);

  return result;
};

const MeelUnitAlgorithm = (specialDateSchedule, result, Bads) => {
  let beforeItem = result.schedule[0];

  specialDateSchedule.schedule.map((item) => {
    if (item.category === "meal") {
      // 충돌 방지
      let BI = beforeItem;
      let I = item;

      while (isCollide(BI.endTime, I.startTime)) {
        StringAddMinute(I.startTime, 30);
        StringAddMinute(I.endTime, 30);
      }

      result.schedule.push(I);

      beforeItem = I;
    }
  });

  return result;
};

const WorkoutUnitAlgorithm = (specialDateSchedule, result, Bads) => {
  let workoutItem = null;

  specialDateSchedule.schedule.map((item) => {
    if (item.category === "workout") {
      workoutItem = item;
    }
  });

  // 운동이 없고 겐세이 할 필요가 없다면
  if (workoutItem === null && !Bads.isWorkoutLess) {
    return result;
  }

  // 운동이 있다면
  if (workoutItem !== null) {
    return Collocator(result, workoutItem);
  }
};

const EtcUnitAlgorithm = (specialDateSchedule, result, Bads) => {
  result.schedule.splice(4, 0, {
    title: "오후 업무",
    category: "etc",
    startTime: "14:00:00",
    endTime: "17:00:00",
  });

  result.schedule.push({
    title: "유튜브 시청",
    category: "etc",
    startTime: "21:30:00",
    endTime: "23:00:00",
  });

  return result;
};

const ScheduleAlgorithm = (schedules, degree) => {
  // 1. schedules의 content to json
  let jsonSchedules = schedules.map((schedule) => {
    return JSON.parse(schedule.content);
  });

  // 2. 특수일 찾기
  const specialDateSchedule = jsonSchedules[6];

  // 3. 못하고 있는 항목 계산
  jsonSchedules = jsonSchedules.slice(0, 5);
  const Bads = BadCalculation(jsonSchedules);

  // 4. 스케줄 생성
  let result = { schedule: [] };

  // 4-1. 수면 유닛 배치
  result = SleepUnitAlgorithm(specialDateSchedule, result, Bads);

  // 4-2. 식사 유닛 배치
  result = MeelUnitAlgorithm(specialDateSchedule, result, Bads);

  // 4-3. 운동 유닛 배치
  result = WorkoutUnitAlgorithm(specialDateSchedule, result, Bads);

  // 4-4. 기타 유닛 배치
  result = EtcUnitAlgorithm(specialDateSchedule, result, Bads);

  // 5. 빈 부분 채우기
  result = FillEmpty(result);
  return JSON.stringify(result);
};

export { ScheduleAlgorithm };
