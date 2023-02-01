import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/components/button.dart';
import 'package:mybiseo_app/provider/AllProvider.dart';
import 'package:mybiseo_app/ui/scheduling_screen.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';
import 'package:provider/provider.dart';

class EvaluationScreen extends StatefulWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  State<EvaluationScreen> createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Consumer<AllProvider>(builder: (context, provider, _) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "오늘 하루는\n어떠셨나요?",
                        style: Font.H1,
                      ),
                    ),
                    Expanded(child: SizedBox.shrink()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 150,
                  child: InfiniteCarousel.builder(
                    itemCount: 5,
                    itemExtent: 120,
                    velocityFactor: 0.2,
                    anchor: 1,
                    center: true,
                    onIndexChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller:
                        InfiniteScrollController(initialItem: currentIndex),
                    axisDirection: Axis.horizontal,
                    loop: false,
                    itemBuilder: (context, itemIndex, realIndex) {
                      bool isReal = itemIndex == currentIndex;
                      print(itemIndex);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 94,
                            height: 94,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Coloring.blue[10 * (itemIndex + 1)],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(99),
                                  bottomRight: Radius.circular(99),
                                  topLeft: Radius.circular(99)),
                            ),
                          ),
                          if (isReal)
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  (currentIndex + 1).toString(),
                                  style: Font.H3,
                                ))
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "알파를 움직여서\n오늘 하루 일정의 성취도를 결정해주세요",
                  style: TextStyle(
                    color: Coloring.gray[30],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child: SizedBox.shrink()),
              Button(
                  title: "다음",
                  onTap: () async {
                    await provider.makeCalendar(DateTime.now());
                    provider.didMake = true;
                    Get.to(SchedulingScreen());
                  })
            ],
          ),
        ),
      );
    });
  }
}
