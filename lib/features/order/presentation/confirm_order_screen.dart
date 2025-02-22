import 'package:flutter/material.dart';

import 'order_success.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () =>
                  showModalBottomSheet(context: context, builder: (context) {
                  return  OrderSuccess();
                  },),
              child: Text("here")),
        ],
      ),
    );
  }
}
