import 'package:flutter/material.dart';

class DismissibleBottomSheet extends StatelessWidget {
  const DismissibleBottomSheet({
    Key? key,
    required this.dismissibleKeyValue,
    required this.child,
  }) : super(key: key);

  final String dismissibleKeyValue;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
              ),
            ),
            Dismissible(
              key: Key(dismissibleKeyValue),
              direction: DismissDirection.down,
              onDismissed: (_) => Navigator.pop(context),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
