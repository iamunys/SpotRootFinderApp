import 'package:spotrootpartner/constant/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentGraph extends StatelessWidget {
  const PaymentGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Constant.bgSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Constant.textWithStyle(
                  text: 'Monthly Statitics',
                  size: 15.sp,
                  maxLine: 3,
                  fontWeight: FontWeight.w500,
                  color: Constant.textPrimary),
              // Row(
              //   children: [
              //     Constant.textWithStyle(
              //         text: 'This Week',
              //         size: 13.sp,
              //         maxLine: 3,
              //         fontWeight: FontWeight.w500,
              //         color: Constant.textSecondary),
              //     const Icon(
              //       Icons.arrow_drop_down,
              //       color: Constant.textSecondary,
              //     )
              //   ],
              // ),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
            height: 30.h,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: Constant.bgPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AspectRatio(
              aspectRatio: 5,
              child: LineChart(LineChartData(
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 5,
                  titlesData: LineTitles.getTitlesData(),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(
                        color: Constant.textSecondary.withOpacity(0.1),
                        strokeWidth: 1),
                    getDrawingVerticalLine: (value) => FlLine(
                        color: Constant.textSecondary.withOpacity(0.1),
                        strokeWidth: 1),
                  ),
                  borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                          color: Constant.textSecondary.withOpacity(0.1),
                          width: 1)),
                  lineBarsData: [
                    LineChartBarData(
                        isCurved: true,
                        barWidth: 2,
                        // dotData: FlDotData(show: false),
                        gradient: const LinearGradient(
                          colors: [Constant.bgGreen, Constant.bgGreen],
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Constant.bgGreen.withOpacity(.2),
                              Constant.bgGreen.withOpacity(.2)
                            ],
                          ),
                        ),
                        spots: const [
                          // FlSpot(0, .2),
                          // FlSpot(1, 2.3),
                          // FlSpot(2, 3),
                          // FlSpot(3, 1.8),
                          // FlSpot(4, 2.5),
                          // FlSpot(5, 4),
                        ])
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}

class LineTitles {
  static getTitlesData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          // axisNameSize: 14.sp,
          sideTitles: SideTitles(
            // interval: 1,
            showTitles: true,
            reservedSize: 20,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return Constant.textWithStyle(
                      text: 'JAN', size: 13.sp, color: Constant.textSecondary);
                case 1:
                  return Constant.textWithStyle(
                      text: 'FEB', size: 13.sp, color: Constant.textSecondary);
                case 2:
                  return Constant.textWithStyle(
                      text: 'MAR', size: 13.sp, color: Constant.textSecondary);
                case 3:
                  return Constant.textWithStyle(
                      text: 'APR', size: 13.sp, color: Constant.textSecondary);
                case 4:
                  return Constant.textWithStyle(
                      text: 'MAY', size: 13.sp, color: Constant.textSecondary);
                case 5:
                  return Constant.textWithStyle(
                      text: 'JUN', size: 13.sp, color: Constant.textSecondary);
                // case 6:
                //   return Constant.textWithStyle(
                //       text: 'JUL', size: 13.sp, color: Constant.textSecondary);
              }
              return Constant.textWithStyle(
                  text: '', size: 13.sp, color: Constant.bgGreen);
            },
          ),
        ),
        leftTitles: AxisTitles(
          // axisNameSize: 14.sp,
          sideTitles: SideTitles(
            // interval: 1,
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return Constant.textWithStyle(
                      text: '0', size: 13.sp, color: Constant.textSecondary);
                case 1:
                  return Constant.textWithStyle(
                      text: '10K', size: 13.sp, color: Constant.textSecondary);
                case 2:
                  return Constant.textWithStyle(
                      text: '20K', size: 13.sp, color: Constant.textSecondary);
                case 3:
                  return Constant.textWithStyle(
                      text: '30K', size: 13.sp, color: Constant.textSecondary);
                case 1:
                  return Constant.textWithStyle(
                      text: '40K', size: 13.sp, color: Constant.textSecondary);
                case 4:
                  return Constant.textWithStyle(
                      text: '50K', size: 13.sp, color: Constant.textSecondary);
                case 5:
                  return Constant.textWithStyle(
                      text: '60K', size: 13.sp, color: Constant.textSecondary);
              }
              return Constant.textWithStyle(
                  text: '', size: 13.sp, color: Constant.bgGreen);
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );
}
