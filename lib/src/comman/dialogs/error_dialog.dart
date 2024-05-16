import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/app/theme/colors.dart';

void showErrorDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(20),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            )),
      );
    },
  );
}
