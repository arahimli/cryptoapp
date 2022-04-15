
import 'package:cryptoapp/config/constants.dart';
import 'package:cryptoapp/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - MainConst.mainPadding.bottom * 2,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: size.height - MainConst.mainPadding.bottom * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: ImageWidget(imageUrl: "assets/user/icon.png",),
              ),

              _StandardMenuGroup(
                marginBottom: 8,
                menuList: [
                  StandardMenuItem(
                    iconItem: Icons.home,
                    marginBottom: 8,
                  ),
                ],
              ),
              Column(
                children: [
                  _MenuGroup(
                    colorItem: MainConst.pinkColor,
                    marginBottom: 8,
                    menuList: [
                      MenuItem(
                        colorItem: MainConst.pinkColor,
                        iconItem: Icons.search,
                        marginBottom: 8,
                      ),
                      MenuItem(
                        iconItem: Icons.rocket,
                        marginBottom: 8,
                      ),
                      MenuItem(
                        iconItem: Icons.image,
                        marginBottom: 8,
                      ),
                      MenuItem(
                        iconItem: Icons.rocket,
                      ),
                    ],
                  ),
                  _MenuGroup(
                    colorItem: MainConst.purpleColor,
                    marginBottom: 8,
                    menuList: [
                      MenuItem(
                        colorItem: MainConst.purpleColor,
                        iconItem: Icons.search,
                        marginBottom: 8,
                      ),
                      MenuItem(
                        iconItem: Icons.rocket,
                        marginBottom: 8,
                      ),
                      MenuItem(
                        iconItem: Icons.image,
                        marginBottom: 8,
                      ),
                      MenuItem(
                        iconItem: Icons.rocket,
                      ),
                    ],
                  ),
                ],
              ),
              _StandardMenuGroup(
                marginBottom: 8,
                menuList: [
                  StandardMenuItem(
                    iconItem: Icons.show_chart,
                    marginBottom: 8,
                  ),
                  StandardMenuItem(
                    iconItem: Icons.diamond,
                    marginBottom: 8,
                  ),
                ],
              ),
              _StandardMenuGroup(
                marginBottom: 0,
                marginTop: 8,
                menuList: [
                  StandardMenuItem(
                    color: Color(0xFFf2c987),
                    iconItem: Icons.multiline_chart,
                    marginBottom: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _MenuGroup extends StatelessWidget {
  final Color? colorItem;
  final double marginTop;
  final double marginBottom;
  final List<Widget> menuList;
  const _MenuGroup({Key? key, this.colorItem, this.marginTop = 0, this.marginBottom = 0, required this.menuList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      padding: MainConst.secondaryPadding,
      decoration: BoxDecoration(
          color: colorItem?.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)
      ),
      child: Column(
        children: menuList,
      ),
    );
  }
}

class _StandardMenuGroup extends StatelessWidget {
  final double marginTop;
  final double marginBottom;
  final List<Widget> menuList;
  const _StandardMenuGroup({Key? key, this.marginTop = 0, this.marginBottom = 0, required this.menuList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      padding: MainConst.secondaryPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)
      ),
      child: Column(
        children: menuList,
      ),
    );
  }
}