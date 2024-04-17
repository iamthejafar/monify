import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/theme/colors.dart';
import '../../../../utils/money_formatter.dart';
import '../../../auth/domain/entity/user.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.userData,
  });

  final List<UserEntity> userData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: deepBlue,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Balance",
                style: textTheme.displaySmall!
                    .copyWith(color: white),
              ),
              Text(
                formatMoney(userData.first.totalBalance),
                style: textTheme.displayLarge!
                    .copyWith(color: white),
              )
            ],
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: PieChart(PieChartData(
                sectionsSpace: 1,
                centerSpaceRadius: 1,
                sections: [
                  PieChartSectionData(
                      titleStyle: textTheme.labelSmall!
                          .copyWith(fontSize: 10),
                      title: (userData.first.expense /
                          userData.first.income *
                          100)
                          .toString(),
                      showTitle: false,
                      color: lightBlue,
                      value: userData.first.income),
                  PieChartSectionData(
                      title: (userData.first.income /
                          userData.first.expense *
                          100)
                          .toString(),
                      showTitle: false,
                      color: creamColor,
                      value: userData.first.expense),
                ],
                borderData: FlBorderData(show: false),
                centerSpaceColor: lightBlue)),
          )
        ],
      ),
    );
  }
}
