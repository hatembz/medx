import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/widgets/custom_switch_item.dart';
import 'package:medx/utils/shared.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification', style: context.textTheme.headlineMedium)),
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
