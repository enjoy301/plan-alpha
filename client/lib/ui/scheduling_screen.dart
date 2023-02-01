import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/components/button.dart';
import 'package:mybiseo_app/ui/bottom_tab_navigator.dart';
import 'package:mybiseo_app/ui/main_tab.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({Key? key}) : super(key: key);

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      topColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "내일 스케줄을\n짜볼까요?",
                      style: Font.H1,
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Text("일정의 양을 어떻게 할까요?", style: Font.Headline),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 95,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Coloring.violet[30],
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        "😄\n쉬고 싶어",
                        style: TextStyle(
                            color: Colors.white, fontSize: 13, height: 1.4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 95,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Coloring.violet[40],
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        "😄\n오늘처럼!",
                        style: TextStyle(
                            color: Colors.white, fontSize: 13, height: 1.4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 95,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Coloring.violet[50],
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        "😄\n할 수 있어",
                        style: TextStyle(
                            color: Colors.white, fontSize: 13, height: 1.4),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DailyCalendar(),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              color: Colors.white,
            )
          ],
        ),
        bottomSheet: Container(
            color: Colors.white,
            height: 80,
            child: Button(title: "이 일정으로 하기", onTap: () {
              Get.offAll(BottomTab());
            })),
      ),
    );
  }
}
