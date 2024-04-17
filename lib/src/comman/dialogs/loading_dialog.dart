import 'package:flutter/material.dart';

import '../../core/app/theme/colors.dart';




void showLoading(BuildContext context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(
                  //   height: 30,
                  //   width: 30,
                  //   child: CircularProgressIndicator(strokeWidth: 3),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      message ?? "Processing, Please wait...",
                    ),
                  ),
                  
                  Image.asset('assets/images/dollar.gif')
                ],
              ),
            )),
      );
    },
  );
}