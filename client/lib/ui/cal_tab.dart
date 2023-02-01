import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';
import 'package:table_calendar/table_calendar.dart';

class CalTab extends StatefulWidget {
  const CalTab({Key? key}) : super(key: key);

  @override
  State<CalTab> createState() => _CalTabState();
}

class _CalTabState extends State<CalTab> {
  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "1월",
                    style: Font.H1,
                  ),
                  Expanded(child: SizedBox.shrink()),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14.5),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: TableCalendar(
                headerVisible: false,
                focusedDay: DateTime.now(),
                firstDay: DateTime.now().subtract(Duration(days: 28)),
                lastDay: DateTime.now().add(
                  Duration(days: 2),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (dateTime, locale) {
                    Map<int, String> mapper = {
                      1: 'M',
                      2: 'T',
                      3: 'W',
                      4: 'T',
                      5: 'F',
                      6: 'S',
                      7: 'S',
                    };
                    return mapper[dateTime.weekday]!;
                  },
                  weekdayStyle: TextStyle(
                      color: Coloring.gray[40],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  weekendStyle: TextStyle(
                      color: Coloring.blue[40],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                  return Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: day.isBefore(DateTime.now())
                            ? Coloring.gray[10 * (1 + 2 * Random().nextInt(4))]
                            : Coloring.green[10],
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(day.day.toString()),
                  );
                }, todayBuilder: (context, day, focusedDay) {
                  return Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(day.day.toString()),
                  );
                }, outsideBuilder: (context, day, focusedDay) {
                  return Container();
                }),
              ),
            ),
            Column(
              children: [
                CalendarListSection(
                    date: '30',
                    day: '월요일',
                    title: '정기모임',
                    subTitle: '동아리 방 가기'),
                CalendarListSection(
                  date: '31',
                  day: '화요일',
                  title: "교수님 면담",
                  subTitle: "진 면담",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CalendarListSection extends StatelessWidget {
  const CalendarListSection(
      {Key? key,
      required this.date,
      required this.day,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final String date;
  final String day;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Coloring.green[10],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Text(
                  date,
                  style: Font.H2,
                ),
                Text(
                  day,
                  style: Font.Caption,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Font.Headline,
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 5),
                ),
                Text(
                  subTitle,
                  style: Font.Caption,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
