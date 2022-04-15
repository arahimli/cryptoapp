import 'package:cryptoapp/components/hover.dart';
import 'package:cryptoapp/config/constants.dart';
import 'package:cryptoapp/config/style.dart';
import 'package:cryptoapp/screens/dashboard/components/mock-data.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';

class DashboardRightContent extends StatefulWidget {
  const DashboardRightContent({Key? key}) : super(key: key);

  @override
  _DashboardRightContentState createState() => _DashboardRightContentState();
}

class _DashboardRightContentState extends State<DashboardRightContent> {

  List<CandleData> _data = MockDataTesla.candles;
  bool _showAverage = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: MainConst.chartColor,
              borderRadius: BorderRadius.circular(16)
            ),
            width: double.infinity,
            height: size.height * 4.5 /10,
            child: InteractiveChart(

              /** Only [candles] is required */
              candles: _data,
              /** Uncomment the following for examples on optional parameters */

              /** Example styling */
              // style: ChartStyle(
              //   priceGainColor: Colors.teal[200]!,
              //   priceLossColor: Colors.blueGrey,
              //   volumeColor: Colors.teal.withOpacity(0.8),
              //   trendLineStyles: [
              //     Paint()
              //       ..strokeWidth = 2.0
              //       ..strokeCap = StrokeCap.round
              //       ..color = Colors.deepOrange,
              //     Paint()
              //       ..strokeWidth = 4.0
              //       ..strokeCap = StrokeCap.round
              //       ..color = Colors.orange,
              //   ],
              //   priceGridLineColor: Colors.blue[200]!,
              //   priceLabelStyle: TextStyle(color: Colors.blue[200]),
              //   timeLabelStyle: TextStyle(color: Colors.blue[200]),
              //   selectionHighlightColor: Colors.red.withOpacity(0.2),
              //   overlayBackgroundColor: Colors.red[900]!.withOpacity(0.6),
              //   overlayTextStyle: TextStyle(color: Colors.red[100]),
              //   timeLabelHeight: 32,
              //   volumeHeightFactor: 0.2, // volume area is 20% of total height
              // ),
              /** Customize axis labels */
              // timeLabel: (timestamp, visibleDataCount) => "📅",
              // priceLabel: (price) => "${price.round()} 💎",
              /** Customize overlay (tap and hold to see it)
               ** Or return an empty object to disable overlay info. */
              // overlayInfo: (candle) => {
              //   "💎": "🤚    ",
              //   "Hi": "${candle.high?.toStringAsFixed(2)}",
              //   "Lo": "${candle.low?.toStringAsFixed(2)}",
              // },
              /** Callbacks */
              // onTap: (candle) => print("user tapped on $candle"),
              // onCandleResize: (width) => print("each candle is $width wide"),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Trade History", style: MainStyles.boldTextStyle.copyWith(fontSize: 20),),
                    SizedBox(width: 12,),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white.withOpacity(0.6),)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down, color: Colors.white.withOpacity(0.6),),
                    SizedBox(width: 12,),
                    Text("BSC", style: MainStyles.boldTextStyle.copyWith(fontSize: 16),),
                    SizedBox(width: 12,),
                    Text("Last 521 Trades", style: MainStyles.semiBoldTextStyle.copyWith(fontSize: 14, color: Colors.white.withOpacity(0.6)),),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                _HistoryWidget(),
                _HistoryWidget(),
                _HistoryWidget(),
                _HistoryWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HistoryWidget extends StatelessWidget {
  const _HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(builder: (isHovered){
      final color = isHovered ? MainConst.historyItemHoverColor : MainConst.historyItemColor;
      return
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16, ),
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("12.12.20"),
              ),
              Expanded(
                flex: 2,
                child: Text("12.12.20"),
              ),
              Expanded(
                flex: 2,
                child: Text("12.12.20"),
              ),
              Expanded(
                flex: 2,
                child: Text("12.12.20"),
              ),
              Expanded(
                flex: 2,
                child: Text("12.12.20"),
              ),
              Expanded(
                flex: 2,
                child: Text("12.12.20"),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.style),
              ),
            ],
          ),
        );

    });
  }
}
