import 'package:flutter/material.dart';

class TextOutputMain extends StatelessWidget {
  const TextOutputMain({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[700],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height - 530,
      width: MediaQuery.of(context).size.width - 100,
      child: child,
    );
  }
}
