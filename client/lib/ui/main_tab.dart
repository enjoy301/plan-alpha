import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/assets/strings.dart';
import 'package:mybiseo_app/components/button.dart';
import 'package:mybiseo_app/provider/AllProvider.dart';
import 'package:mybiseo_app/ui/evaluation_screen.dart';
import 'package:mybiseo_app/ui/user/user_screen.dart';
import 'package:provider/provider.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AllProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Coloring.bg_color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// 상단 데일리 부분
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "데일리",
                      style: Font.H1,
                    ),
                    Expanded(child: SizedBox.shrink()),
                    IconButton(
                      onPressed: () {
                        Get.to(UserScreen());
                      },
                      icon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),

              /// 날짜랑 요약 부분
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 32, horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                        DateTime.now().month.toString() +
                            "월 " +
                            DateTime.now().day.toString() +
                            "일 ",
                        style: Font.H3),
                    Text("오늘 중요한 일정이 1개 있어요"),
                    Row(
                      children: provider.calendar
                          .map((e) => SummaryBarSection(
                                type: e['title'] == 'empty'
                                    ? 'null'
                                    : e['category'],
                                start: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  int.parse(e['startTime'].substring(0, 2)),
                                  int.parse(e['startTime'].substring(3, 5)),
                                ),
                                end: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  int.parse(e['endTime'].substring(0, 2)),
                                  int.parse(e['endTime'].substring(3, 5)),
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      children: [
                        Text("0:00"),
                        Expanded(child: SizedBox.shrink()),
                        Text("24:00"),
                      ],
                    ),
                  ],
                ),
              ),

              /// 내일 일정 버튼
              if (!provider.didMake)
                Button(
                  title: "내일 일정 만들기",
                  onTap: () {
                    Get.to(EvaluationScreen());
                  },
                ),

              /// 세로축 스케줄
              DailyCalendar(),
            ],
          ),
        ),
      );
    });
  }
}

class SummaryBarSection extends StatefulWidget {
  const SummaryBarSection(
      {Key? key,
      required this.type,
      required this.start,
      required this.end,
      this.first = false,
      this.last = false})
      : super(key: key);

  final String type;
  final DateTime start;
  final DateTime end;
  final bool first;
  final bool last;

  @override
  State<SummaryBarSection> createState() => _SummaryBarSectionState();
}

class _SummaryBarSectionState extends State<SummaryBarSection> {
  final Map<String, Color> colorMap = {
    'null': Colors.white,
    Strings.sleep: Coloring.gray[10]!,
    Strings.meal: Coloring.green[10]!,
    Strings.workout: Coloring.blue[40]!,
    Strings.hack: Coloring.red[30]!,
    Strings.etc: Coloring.violet[20]!
  };

  int length = 0;

  @override
  void initState() {
    super.initState();
    Duration duration = widget.end.difference(widget.start);
    length = duration.inHours;
    print(length);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: length,
      child: Container(
        height: 25,
        decoration: BoxDecoration(
            color: colorMap[widget.type],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.first ? 4 : 0),
              bottomLeft: Radius.circular(widget.first ? 4 : 0),
              topRight: Radius.circular(widget.last ? 4 : 0),
              bottomRight: Radius.circular(widget.last ? 4 : 0),
            )),
      ),
    );
  }
}

class DailyCalendar extends StatelessWidget {
  const DailyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllProvider>(builder: (context, provider, _) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 27),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
            children: provider.calendar
                .map(
                  (e) => DailyCalendarSection(
                    start: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      int.parse(e['startTime'].substring(0, 2)),
                      int.parse(e['startTime'].substring(3, 5)),
                    ),
                    end: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      int.parse(e['endTime'].substring(0, 2)),
                      int.parse(e['endTime'].substring(3, 5)),
                    ),
                    title: e['title'],
                    type: e['title'] == 'empty' ? 'null' : e['category'],
                  ),
                )
                .toList()),
      );
    });
  }
}

class DailyCalendarSection extends StatefulWidget {
  const DailyCalendarSection(
      {Key? key,
      this.title = '',
      this.type,
      required this.start,
      required this.end})
      : super(key: key);

  final String title;
  final String? type;
  final DateTime start;
  final DateTime end;

  @override
  State<DailyCalendarSection> createState() => _DailyCalendarSectionState();
}

class _DailyCalendarSectionState extends State<DailyCalendarSection> {
  bool is_blank = false;
  int length = 0;

  @override
  void initState() {
    super.initState();
    if (widget.type == 'null') {
      is_blank = true;
    }
    Duration duration = widget.end.difference(widget.start);
    length = duration.inHours;
    print(length);
  }

  final Map<String, Color> colorMap = {
    "null": Coloring.gray[40]!,
    Strings.sleep: Coloring.gray[10]!,
    Strings.meal: Coloring.green[10]!,
    Strings.workout: Coloring.blue[40]!,
    Strings.hack: Coloring.red[30]!,
    Strings.etc: Coloring.violet[20]!
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: is_blank ? 4 : 12,
            height: (length + 2) * 12,
            margin: EdgeInsets.only(left: is_blank ? 4 : 0, right: 16),
            decoration: BoxDecoration(
                color: colorMap[widget.type],
                borderRadius: BorderRadius.circular(99)),
          ),
          Text(
            widget.type == 'null' ? "" : widget.title,
            style: Font.Headline,
          ),
          Expanded(child: SizedBox.shrink()),
          if (!is_blank)
            Text(DateFormat('HH:mm').format(widget.start) +
                "-" +
                DateFormat('HH:mm').format(widget.end)),
        ],
      ),
    );
  }
}
