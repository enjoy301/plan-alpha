import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  int current_index = 0;
  List<String> head = [
    "Plan alpha 가동!",
    "의지의 불씨",
    "명예의 훈장",
    "우승 트로피",
    "정복자의 깃발",
    "나는야 끈기왕",
  ];
  List<String> des = [
    "Plan alpha의 캘린더 자동완성 기능을\n처음으로 사용하였어요",
    "처음으로 Hack을 등록했어요",
    "처음으로 Hack을 성공했어요",
    "Hack을 총 5개 성공했어요",
    "Hack을 총 12개 성공했어요",
    "Hack을 30일 동안 빠짐없이 등록했어요",
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      bottomColor: Coloring.bg_color,
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 30),
              color: Coloring.bg_color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 50,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Text(
                      "업적",
                      style: Font.H1,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color:
                        current_index < 6 ? Colors.white : Coloring.gray[20]!,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (current_index < 6)
                      Center(
                        child: Image.asset(
                          "lib/assets/엠블럼/엠블럼" +
                              (current_index + 7).toString() +
                              ".png",
                          width: 300,
                          height: 300,
                        ),
                      ),
                    if (current_index >= 6)
                      Center(
                        child: Transform.scale(
                          scale: 1.5,
                          child: Image.asset(
                            "lib/assets/images/reward_lock.png",
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        current_index < 6 ? head[current_index] : "잠긴 업적",
                        style: TextStyle(
                            color: current_index < 6
                                ? Coloring.gray[90]
                                : Coloring.gray[70],
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        current_index < 6
                            ? des[current_index]
                            : "조금 더 Hack을 진행하면\n알 수 있을 거에요.",
                        style: TextStyle(
                            color: current_index < 6
                                ? Coloring.gray[40]
                                : Coloring.gray[70],
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(vertical: 45),
              child: InfiniteCarousel.builder(
                  loop: false,
                  itemCount: 20,
                  itemExtent: 90,
                  anchor: 100,
                  axisDirection: Axis.horizontal,
                  onIndexChanged: (index) {
                    setState(() {
                      current_index = index;
                    });
                  },
                  itemBuilder: (context, itemIndex, realIndex) {
                    return Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: itemIndex > 5
                            ? Coloring.gray[20]
                            : current_index == itemIndex
                                ? Coloring.blue[20]
                                : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(99),
                          bottomRight: Radius.circular(99),
                          topLeft: Radius.circular(99),
                        ),
                      ),
                      child: itemIndex <= 5
                          ? Image.asset(
                              "lib/assets/엠블럼/엠블럼" +
                                  (itemIndex + 7).toString() +
                                  ".png",
                              width: 40,
                              height: 40,
                            )
                          : Image.asset(
                              "lib/assets/images/reward_lock.png",
                              width: 40,
                              height: 40,
                            ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
