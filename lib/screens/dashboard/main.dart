import 'package:cryptoapp/config/constants.dart';
import 'package:cryptoapp/config/responsive.dart';
import 'package:cryptoapp/config/style.dart';
import 'package:cryptoapp/screens/dashboard/components/header.dart';
import 'package:cryptoapp/screens/dashboard/components/left-content.dart';
import 'package:cryptoapp/screens/dashboard/components/right-content.dart';
import 'package:cryptoapp/screens/dashboard/components/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: MainConst.mainPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(ResponsiveBase.isDesktop(context))
              SidebarWidget(),
              Expanded(
                // flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      HeaderWidget(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            // color: Colors.yellow,
                            padding: EdgeInsets.only(top: 32),
                            child: ResponsiveBase.isDesktop(context) ? Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: DashboardLeftContent(),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: DashboardRightContent(),
                                ),
                              ],
                            ) : Column(
                              children: [
                                DashboardLeftContent(),
                                DashboardRightContent(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RowOrColumn extends StatelessWidget {
  final List<Widget> children;
  final RowOrColumnEnum wType;
  const RowOrColumn({Key? key, required this.children, required this.wType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return wType == RowOrColumnEnum.ROW ? Row(children: children,) : Column(children: children,);
  }
}

enum RowOrColumnEnum {ROW, COLUMN}