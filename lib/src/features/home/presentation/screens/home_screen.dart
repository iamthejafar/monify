import 'package:auto_route/annotations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:monify/src/core/app/theme/colors.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: creamColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Evening",
                      style: textTheme.displayMedium,
                    ),
                    Text(
                      "Guest User",
                      style: textTheme.displayLarge!.copyWith(fontSize: 32),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
            ),
            toolbarHeight: 90,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [

                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: deepBlue, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Balance",
                              style: textTheme.displaySmall!.copyWith(color: white),
                            ),
                            Text(
                              "₹ 34501",
                              style: textTheme.displayLarge!.copyWith(color: white),
                            )
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          child: PieChart(PieChartData(
                              sectionsSpace: 1,
                              centerSpaceRadius: 1,
                              sections: [
                                PieChartSectionData(
                                    titleStyle: textTheme.labelSmall!.copyWith(fontSize: 10),
                                    title: "60 %",
                                    showTitle: true, color: lightBlue, value: 110),
                                PieChartSectionData(
                                    showTitle: false, color: creamColor, value: 20),
                              ],
                              borderData: FlBorderData(show: false),
                              centerSpaceColor: lightBlue)),
                        )
                      ],
                    ),
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: creamColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Income"),
                                  Text("1000")
                                ],
                              ),
                              CircleAvatar(
                                child: Icon(Icons.monetization_on),
                              )
                            ],
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: creamColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Expense"),
                                  Text("1000")
                                ],
                              ),
                              CircleAvatar(
                                child: Icon(Icons.monetization_on),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Gap(10),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Expenses"),
                            TextButton(onPressed: (){}, child: Text("View All"))

                          ],
                        ),
                        ListTile(
                          leading: Text("Rs. 5000"),
                          trailing: Text("Books"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      )
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.analytics_outlined),
      //       label: "Home"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Text(""),
      //       label: ""
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.monetization_on_outlined),
      //       label: "Savings"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "Home"
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //
      //   },
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
