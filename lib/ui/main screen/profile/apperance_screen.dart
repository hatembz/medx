import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/widgets/custom_switch_item.dart';
import 'package:medx/utils/shared.dart';

class ApperanceScreen extends StatefulWidget {
  const ApperanceScreen({Key? key}) : super(key: key);

  @override
  State<ApperanceScreen> createState() => _ApperanceScreenState();
}

class _ApperanceScreenState extends State<ApperanceScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apperance', style: context.textTheme.headlineMedium)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            gap(context),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'Notification',
              value: true,
              onchanged: (p0) => {},
            ),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'Vibrate',
              value: true,
              onchanged: (p0) => {},
            ),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'New tips available',
              value: false,
              onchanged: (p0) => {},
            ),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'New service Available',
              value: false,
              onchanged: (p0) => {},
            ),
          ],
        ),
      ),
    );
  }
}
