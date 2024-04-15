import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/app/theme/colors.dart';



void successDialog(BuildContext context,
    {String? message, Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: white,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 270),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Gap(20),
            Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: lightBlue,
                shape: BoxShape.circle,
              ),
              child: const Center(child: Icon(Icons.check,size: 50, color: white,)),
            ),
            Gap(14),
            Text(
              "Successful",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(20),
            Text(
              message ?? "Task completed successfully",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                onPressed: onPressed ?? () => Navigator.pop(context),
                child: const Text('Ok',style: TextStyle(color: black, fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
