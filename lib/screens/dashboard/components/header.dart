

import 'package:cryptoapp/config/constants.dart';
import 'package:cryptoapp/config/responsive.dart';
import 'package:cryptoapp/config/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: ResponsiveBase.isMobile(context) ? 3 : 2,
            child: Text(
              "Pankake Swap pair",
              style: MainStyles.appbarStyle, maxLines: 1, overflow: TextOverflow.ellipsis,
            ),
          ),
          if(!ResponsiveBase.isMobile(context))
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, ),
              child: Row(
                children: [

                  Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          if(!ResponsiveBase.isMobile(context))
                          Expanded(
                            child: CupertinoSearchTextField(
                              prefixInsets: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14,),
                              decoration: BoxDecoration(
                                  color: MainConst.secondaryBgColor,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                            ),
                          ),
                          if(ResponsiveBase.isDesktop(context))
                          Container(
                            decoration: BoxDecoration(
                                color: MainConst.purpleColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8, ),
                            child: Row(
                              children: [
                                MenuItem(
                                  iconItem: Icons.search,
                                  colorItem: MainConst.purpleColor,
                                  // marginBottom: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child:Text("Switch to ETH", style: MainStyles.mediumTextStyle.copyWith(fontSize: 14),),
                                )
                              ],
                            ),
                          )

                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ProfileCard(),
                      if(!ResponsiveBase.isDesktop(context))
                      StandardMenuItem(
                        iconItem: Icons.menu,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          if(ResponsiveBase.isMobile(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ProfileCard(),
              if(!ResponsiveBase.isDesktop(context))
                StandardMenuItem(
                  iconItem: Icons.menu,
                )
            ],
          )
        ],
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final Color? colorItem;
  final IconData? iconItem;
  final double marginTop;
  final double marginBottom;

  const MenuItem({Key? key, this.colorItem, this.iconItem, this.marginTop = 0, this.marginBottom = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      decoration: BoxDecoration(
          color: colorItem,
          borderRadius: BorderRadius.circular(100)
      ),
      padding: MainConst.iconPadding,
      child: Icon(iconItem ?? Icons.menu, size: 22,),
    );
  }
}

class StandardMenuItem extends StatelessWidget {
  final IconData? iconItem;
  final double marginTop;
  final double marginBottom;
  final Color? color;

  const StandardMenuItem({Key? key, this.iconItem, this.marginTop = 0, this.marginBottom = 0, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)
      ),
      child: Icon(iconItem ?? Icons.menu, size: 24, color: color,),
    );
  }
}



class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MainConst.mainPadding.left),
      padding: EdgeInsets.symmetric(
        horizontal: MainConst.mainPadding.left,
        vertical: MainConst.mainPadding.left / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Icon(Icons.keyboard_arrow_down),
          ImageWidget(imageUrl: "assets/user/icon.png",),
        ],
      ),
    );
  }
}



class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  const ImageWidget({Key? key, required this.imageUrl, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(
        imageUrl,
        height: height ?? 36,

      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final double? height;
  const IconWidget({Key? key, required this.iconData, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??36,
      width: height??36,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((height??36) * 1 / 3),
        border: Border.all(color: MainConst.secondaryTextColor)
      ),
      child: Icon(iconData),
    );
  }
}