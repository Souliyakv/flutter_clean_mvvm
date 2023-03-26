import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTitle extends StatelessWidget {
  final String? text;
  const AppTitle({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text.toString(),
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
