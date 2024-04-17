import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:monify/src/comman/dialogs/loading_dialog.dart';
import 'package:monify/src/comman/validators/text_validation.dart';
import 'package:monify/src/core/app/theme/colors.dart';
import 'package:monify/src/features/home/presentation/provider/add_transaction_provider.dart';
import 'package:monify/src/utils/user_preferences.dart';

import '../../../../comman/widgets/app_text_field.dart';

@RoutePage()
class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key, required this.isExpense});

  final bool isExpense;

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _nameFocus = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _amountFocus = FocusNode();
  final TextEditingController _amountController = TextEditingController();

  DateTime? _date;

  bool _isExpense = true;

  @override
  void initState() {
    _isExpense = widget.isExpense;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      initialIndex: widget.isExpense ? 1 : 0,
      length: 2,
      child: Scaffold(
        backgroundColor: pale,
        floatingActionButton: FloatingActionButton(
          backgroundColor: creamColor,
          heroTag: "float",
          onPressed: () async {
            showLoading(context);
            await ref.read(addTransactionProvider.notifier).addTransaction(
                uid: UserPreferences.userId,
                amount: double.parse(_amountController.text.trim()),
                transactionType: _isExpense ? "Expense" : "Income",
                transactionName: _nameController.text.trim(),
                transactionDate: _date!,
                context: context);
          },
          child: const Icon(
            Icons.save,
            color: deepBlue,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                title: const Text("Add Transaction"),
                bottom: TabBar(
                  labelPadding: EdgeInsets.only(top: 10),
                  indicatorWeight: 5,
                  indicator: BoxDecoration(
                      color: pale,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  labelStyle: textTheme.displayMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                  unselectedLabelStyle: textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (val) {
                    setState(() {
                      if (val == 0) {
                        _isExpense = false;
                      } else {
                        _isExpense = true;
                      }
                    });
                  },
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Text("Income"),
                    Text("Expense"),
                  ],
                )),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add ${_isExpense ? "Expense" : "Income"}",
                        style: textTheme.displayLarge,
                      ),
                      Gap(10),
                      AppTextField(
                        hintText: 'Transaction name',
                        focusNode: _nameFocus,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) => Validate.empty(value!),
                        // inputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        hintText: 'Amount',
                        focusNode: _amountFocus,
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter the amount";
                          } else if (double.parse(val) <= 0) {
                            return "Please enter a valid amount";
                          }
                          return null;
                        },
                        prefixText: '₹ ',
                        // inputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          final DateTime now = DateTime.now();

                          final DateTime? date = await showDatePicker(
                            context: context,
                            currentDate: _isExpense != null ? _date : null,
                            firstDate: now.subtract(const Duration(days: 30)),
                            lastDate: now,
                          );

                          date != null ? setState(() => _date = date) : null;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(0.06)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _date != null
                                  ? DateFormat('dd/MM/yy')
                                      .format(_date!)
                                      .toString()
                                  : 'Date',
                              style: textTheme.displayMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
