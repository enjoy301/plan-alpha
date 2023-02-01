import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/ui/reward_screen.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "리포트",
                      style: Font.H1,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(RewardScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 19),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "나는야 끈기왕\n김말랑실",
                            style: Font.H3,
                          ),
                          Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: Coloring.blue[10],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ReportSegment(
                              emoticon: "🏃🏻",
                              day: "9일째",
                              subtext: "연속 진행중",
                            ),
                            Container(
                              width: 1,
                              height: 25,
                              color: Coloring.gray[50],
                            ),
                            ReportSegment(
                                emoticon: "⚡️", day: "5회", subtext: "Hack 성공")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 19),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current_index = 0;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "7일간 통계",
                                style: TextStyle(
                                    color: current_index == 0
                                        ? Coloring.gray[90]
                                        : Coloring.gray[30],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current_index = 1;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "HACK",
                                style: TextStyle(
                                    color: current_index == 1
                                        ? Coloring.gray[90]
                                        : Coloring.gray[30],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (current_index == 0)
                      Column(
                        children: [
                          Text(
                            "삶 균형표",
                            style: TextStyle(
                                color: Coloring.gray[70],
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SemicircularIndicator(
                              contain: true,
                              progress: 0.8,
                              color: Coloring.violet[40]!,
                              backgroundColor: Coloring.gray[10]!,
                              child: Column(
                                children: [
                                  Text(
                                    "80점",
                                    style: TextStyle(
                                        color: Coloring.blue[30], fontSize: 24),
                                  ),
                                  Text(
                                    "잘하고 있어요! 😊",
                                    style: TextStyle(
                                        color: Coloring.gray[90], fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (current_index == 1)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                HackSegment(
                                  start: DateTime(2023, 1, 10),
                                  end: DateTime(2023, 1, 30),
                                  title: "Coursera Andrew ng 교수 강의 다 듣기",
                                  color: Coloring.red[20]!,
                                  term: "30일 동안",
                                ),
                                HackSegment(
                                  start: DateTime(2023, 1, 10),
                                  end: DateTime(2023, 2, 20),
                                  title: 'Tech 블로그 매일 쓰기',
                                  color: Coloring.green[20]!,
                                  term: "100일 동안",
                                ),
                                HackSegment(
                                  start: DateTime(2023, 1, 1),
                                  end: DateTime(2023, 9, 25),
                                  title: "Flutter 공부 하기",
                                  color: Coloring.blue[20]!,
                                  term: "10일 동안",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    log("Flutter 공부 하기");
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Icon(Icons.add),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
                                          child: Text("새 Hack 등록하기"),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 19),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "알파의 조언",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(""),
                      Text(
                        "> OO님, 자기계발 시간이 너무 짧은 것 같아요. 더 나은 내일을 위해, 더 노력해보는 건 어떨까요?",
                        style: TextStyle(
                            color: Coloring.gray[80],
                            fontSize: 16,
                            height: 1.25),
                      ),
                      Text(""),
                      Text(
                        "> 오늘로 플랜을 짠 지 일주일이 되었어요! 축하드려요. 앞으로도 같이 열심히 플랜을 실천해봐요.",
                        style: TextStyle(
                            color: Coloring.gray[80],
                            fontSize: 16,
                            height: 1.25),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportSegment extends StatefulWidget {
  const ReportSegment(
      {Key? key,
      required this.emoticon,
      required this.day,
      required this.subtext})
      : super(key: key);

  final String emoticon;
  final String day;
  final String subtext;

  @override
  State<ReportSegment> createState() => _ReportSegmentState();
}

class _ReportSegmentState extends State<ReportSegment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.emoticon,
            style: TextStyle(fontSize: 26),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.day,
                  style: Font.Headline,
                ),
                Text(
                  widget.subtext,
                  style: TextStyle(color: Coloring.gray[50], fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HackSegment extends StatefulWidget {
  const HackSegment(
      {Key? key,
      required this.start,
      required this.end,
      required this.color,
      required this.title,
      required this.term})
      : super(key: key);

  final DateTime start;
  final DateTime end;
  final Color color;
  final String title;
  final String term;

  @override
  State<HackSegment> createState() => _HackSegmentState();
}

class _HackSegmentState extends State<HackSegment> {
  double ratio = 0;

  @override
  void initState() {
    super.initState();
    int totalDuration = widget.end.difference(widget.start).inSeconds;
    int pastDuration = DateTime.now().difference(widget.start).inSeconds;
    ratio = pastDuration * 10 / totalDuration;
    print(ratio);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Font.Headline,
          ),
          Text(
            widget.term,
            style: Font.Caption,
          ),
          StepProgressIndicator(
            totalSteps: 10,
            size: 8,
            customColor: (index) {
              if (index + 1 > ratio) {
                return Coloring.gray[10]!;
              }
              return widget.color;
            },
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: Coloring.gray[10],
          )
        ],
      ),
    );
  }
}
