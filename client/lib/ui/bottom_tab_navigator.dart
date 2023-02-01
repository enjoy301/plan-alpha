import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/ui/cal_tab.dart';
import 'package:mybiseo_app/ui/main_tab.dart';
import 'package:mybiseo_app/ui/report_tab.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int page_idx = 0;
  List<StatefulWidget> pages = [
    MainTab(),
    CalTab(),
    ReportTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        body: pages[page_idx],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    page_idx = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.access_time_outlined,
                                  color: page_idx == 0
                                      ? Coloring.blue[40]
                                      : Color(0XFFCBCBCB),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    page_idx = 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: page_idx == 1
                                      ? Coloring.blue[40]
                                      : Color(0XFFCBCBCB),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  page_idx = 2;
                                });
                              },
                              icon: Icon(Icons.auto_graph_rounded),
                              color: page_idx == 2
                                  ? Coloring.blue[40]
                                  : Color(0XFFCBCBCB),
                            ),
                          ],
                        ),
                      ],
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
