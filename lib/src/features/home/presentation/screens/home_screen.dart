import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:monify/src/core/app/router/router.gr.dart';
import 'package:monify/src/core/app/theme/colors.dart';
import 'package:monify/src/features/home/presentation/provider/transaction_provider.dart';
import 'package:monify/src/utils/user_preferences.dart';

import '../../../../utils/money_formatter.dart';
import '../widgets/balance_widget.dart';
import '../widgets/home_page_app_bar.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getTransactionProvider);
    final userData = controller.userModel;
    final transaction = controller.transactions;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: controller.loadingState == HomeLoadingState.loading
          ? Center(
              child: SizedBox(
                height: 400,
                child: Image.asset("assets/images/dollar.gif"),
              ),
            )
          : CustomScrollView(
              slivers: [
                HomePageAppBar(userData: userData),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        BalanceWidget(userData: userData),
                        const Gap(20),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  context.router.push(
                                      AddTransactionRoute(isExpense: false)).then((value) => ref.read(getTransactionProvider.notifier).getTransaction(uid: UserPreferences.userId));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: pale,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text("Income"),
                                          Text(formatMoney(
                                              userData.first.income))
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.add),
                                          SizedBox(
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/income.png")),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  context.router.push(
                                      AddTransactionRoute(isExpense: true)).then((value) => ref.read(getTransactionProvider.notifier).getTransaction(uid: UserPreferences.userId));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: creamColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text("Expense"),
                                          Text(formatMoney(
                                              userData.first.expense))
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.add),
                                          SizedBox(
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/images/expense.png")),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recent Expenses", style: textTheme.displayMedium,),
                                IconButton(
                                    onPressed: () {
                                      context.router.push(AddTransactionRoute(isExpense: false)).then((value) => ref.read(getTransactionProvider.notifier).getTransaction(uid: UserPreferences.userId));
                                    },
                                    icon: const Icon(Icons.add),)
                              ],
                            ),
                            if(transaction.isEmpty)
                              Text("No Transaction Added.")
                            else
                              ListView.builder(
                                reverse: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: transaction.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final model = transaction[index];
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: pale,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 1,
                                              spreadRadius: 1
                                          )
                                        ],
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(model.transactionName, style: textTheme.displayLarge,),
                                            Text(DateFormat('dd/MM')
                                                .format(model.transactionDate))
                                          ],
                                        ),
                                        Text((model.transactionType == "Expense" ? " - " : " + " )+ (formatMoney(model.amount)))
                                      ],
                                    ),
                                  );
                                },
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}


