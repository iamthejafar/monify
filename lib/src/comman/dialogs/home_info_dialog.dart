import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeInfoDialog extends StatelessWidget {
  const HomeInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Info'),
      content: Center(
        child: Text(
            'Hey there! this is my submission for the assessment at '
                'MSA Software.\n\n'
                'If you\'re reading this, I hope you like what you see. I could not '
                'find enough time to work on it, so it\'s extremely bare-bones. '
                'The main culprit however was Clean Architecture.\n'
                'Regardless, hello new teammate (hopefully)!',
        ),
      ),
    );
  }
}
