import 'package:flutter/material.dart';
import 'package:gap/gap.dart';




void failedDialog(BuildContext context,
    {String? message, Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 416),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Center(child: Icon(Icons.close)),
            ),
            Gap(14),
            Text(
              "Failed",
            ),
            Gap(20),
            Text(
              message ?? "Failed to upload",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                onPressed: onPressed ?? () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
