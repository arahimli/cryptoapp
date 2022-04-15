import 'dart:async';

import 'package:cryptoapp/config/constants.dart';
import 'package:cryptoapp/config/style.dart';
import 'package:cryptoapp/screens/dashboard/components/chart.dart';
import 'package:cryptoapp/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

import 'dart:ui' as ui;
class DashboardLeftContent extends StatefulWidget {
  const DashboardLeftContent({Key? key}) : super(key: key);

  @override
  _DashboardLeftContentState createState() => _DashboardLeftContentState();
}

class _DashboardLeftContentState extends State<DashboardLeftContent> {

  @override
  void initState() {
    super.initState();
  }

  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };



  final colorList = <Color>[
    Color(0xfffdcb6e),
    Color(0xff0984e3),
    Color(0xfffd79a8),
    Color(0xffe17055),
    Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  int key = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                Container(
                  // padding: EdgeInsets.only(top: 8, bottom: 32),
                  child: ImageWidget(imageUrl: "assets/user/icon.png", height: 42,),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                            TextSpan(
                                text: 'BSC',
                                style: MainStyles.regularTextStyle.copyWith(fontSize: 18),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' / ',
                                    style: MainStyles.boldTextStyle.copyWith(fontSize: 18),
                                  ),
                                  TextSpan(
                                    text: 'Cake',
                                    style: MainStyles.blackTextStyle.copyWith(fontSize: 18),
                                  )
                                ]
                            )
                        ),
                        Text(
                          "Pancake Swap token: 0x23454lU@e&aldkeuUA",
                          style: MainStyles.semiBoldTextStyle.copyWith(color: MainConst.secondaryTextColor, fontSize: 12),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  // padding: EdgeInsets.only(top: 8, bottom: 32),
                  child: IconWidget(iconData: Icons.add, height: 42,),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CustomIconButton(
                        iconData: Icons.subdirectory_arrow_right,
                      ),
                      SizedBox(width: 8,),
                      CustomIconButton(
                        iconData: Icons.star,
                        color: Color(0xFFf2c987),
                      ),
                      SizedBox(width: 8,),
                      CustomIconButton(
                        iconData: Icons.share,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedBorderButton(
                        title: "Trade",
                        color: Color(0xFFb17877),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("94202129", style: MainStyles.boldTextStyle.copyWith(fontSize: 36),),
                    Text(" \$", style: MainStyles.boldTextStyle.copyWith(fontSize: 20),),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.square_foot, color: MainConst.purpleColor,),
                          SizedBox(width: 4,),
                          Text("0.94202129", style: MainStyles.boldTextStyle.copyWith(fontSize: 14, color: MainConst.secondaryTextColor),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("24H:", style: MainStyles.boldTextStyle.copyWith(fontSize: 14, color: MainConst.secondaryTextColor),),
                          SizedBox(width: 4,),
                          Text("+5.74", style: MainStyles.boldTextStyle.copyWith(fontSize: 14, color: MainConst.secondaryTextColor),),
                          SizedBox(width: 4,),
                          Icon(Icons.navigation, color: Colors.blue,),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  height: size.height * 4 / 10,
                  child: GridView.count(
                      padding: EdgeInsets.only(
                          top: 8,
                          left: 0,
                          right: 0),
                      // physics: ScrollPhysics(),
                      physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true,
                      // You won't see infinite size error
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                      crossAxisSpacing: 24.0,
                      mainAxisSpacing: 24.0,
                      children: [
                        HomeCategoryItem(
                          icon: Icons.insert_chart,
                          iconColor: MainConst.pinkColor,
                          title: "Total Liqualidty",
                          subTitle: "\$1802373",
                        ),
                        HomeCategoryItem(
                          icon: Icons.show_chart,
                          iconColor: MainConst.purpleColor,
                          title: "Daily Volume",
                          subTitle: "\$23243461",
                        ),
                        HomeCategoryItem(
                          icon: Icons.pie_chart,
                          iconColor: MainConst.purpleColor,
                          title: "Poloed Bsc",
                          subTitle: "12.06",
                        ),
                        HomeCategoryItem(
                          icon: Icons.show_chart,
                          iconColor: MainConst.pinkColor,
                          title: "Poloed Cake",
                          subTitle: "124.32",
                        ),
                        HomeCategoryItem(
                          icon: Icons.pie_chart,
                          iconColor: MainConst.pinkColor,
                          title: "Total Liqualidty",
                          subTitle: "\$1802373",
                        ),
                        HomeCategoryItem(
                          icon: Icons.show_chart,
                          iconColor: MainConst.purpleColor,
                          title: "Daily Volume",
                          subTitle: "\$23243461",
                        ),
                      ]
                    // List.generate(
                    //     snapshot.data.data.length,
                    //     (index) => MainHomeCategoryItem(
                    //           category: snapshot.data.data[index],
                    //         ))

                    // ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Total Score", style: MainStyles.semiBoldTextStyle.copyWith(fontSize: 20, color: Colors.white),),
                            ),
                            Text("96", style: MainStyles.semiBoldTextStyle.copyWith(fontSize: 28, color: Colors.white),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ChartWidget(),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Comunity Trust", style: MainStyles.semiBoldTextStyle.copyWith(fontSize: 16, color: MainConst.secondaryTextColor),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.red,),
                                Text("86%", style: MainStyles.semiBoldTextStyle.copyWith(fontSize: 14, color: MainConst.secondaryTextColor),),
                              ],
                            ),
                          ),
                          Text("25 Votes", style: MainStyles.semiBoldTextStyle.copyWith(fontSize: 14, color: MainConst.secondaryTextColor),),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.all(0),
                    lineHeight: 4.0,
                    percent: 0.9,
                    progressColor: Colors.blue,
                    // fillColor: MainConst.gridItemColor,
                    backgroundColor: MainConst.gridItemColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCategoryItem extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final String title;
  final String subTitle;
  const HomeCategoryItem({Key? key, required this.iconColor, required this.icon, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: MainConst.gridItemColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              color:iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)
            ),
              child: Icon(icon)
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(title, style: MainStyles.semiBoldTextStyle.copyWith(color: MainConst.secondaryTextColor ,fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis,),
                ),
                Container(
                    child: Text(subTitle, style: MainStyles.boldTextStyle.copyWith(fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PieData {
  String activity;
  double time;
  PieData(this.activity, this.time);
}


class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  const CustomIconButton({Key? key, required this.iconData, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: MainConst.secondaryTextColor),
            borderRadius: BorderRadius.circular(14)
        ),
        child: Icon(iconData, color: color ?? MainConst.secondaryTextColor, size: 18,));
  }
}

class RoundedBorderButton extends StatelessWidget {
  final String title;
  final Color? color;
  const RoundedBorderButton({Key? key, required this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: color ?? MainConst.secondaryTextColor),
            borderRadius: BorderRadius.circular(14)
        ),
        child: Text(title, style: MainStyles.semiBoldTextStyle.copyWith( fontSize: 16),));
  }
}


enum LegendShape { Circle, Rectangle }
