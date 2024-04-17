
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:monify/src/core/app/router/router.gr.dart';
import 'package:monify/src/utils/user_preferences.dart';

import '../../../../comman/dialogs/home_info_dialog.dart';
import '../../../../core/app/theme/colors.dart';
import '../../../../core/app/theme/colors.dart';
import '../../../../utils/time_formatter.dart';
import '../../../auth/domain/entity/user.dart';
class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.userData,
  });

  final List<UserEntity> userData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      floating: true,
      snap: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good ${getTimePeriod()}",
                style:
                textTheme.displayMedium!.copyWith(color: black),
              ),
              const Gap(5),
              Text(
                userData.first.name,
                style: textTheme.displayMedium!
                    .copyWith(color: black, fontSize: 32),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () async => await showCupertinoDialog(
              barrierDismissible: true,
              context: context,
              builder: (ctx) => const HomeInfoDialog()),
          icon: const Icon(
            Icons.info_outline_rounded,
            color: deepBlue,
          ),
          tooltip: 'Info',
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          onPressed: () {
            UserPreferences.removeUser();
            context.router.replaceAll([AuthRoute()]);

            // context.read<SignInBloc>().add(SigningOut());
          },
          icon:  Icon(
            Icons.logout,
            color: deepBlue,
          ),
          tooltip: 'Logout',
          visualDensity: VisualDensity.compact,
        ),
      ],
      toolbarHeight: 90,
    );
  }
}
