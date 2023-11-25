import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/widgets/custom_switch_item.dart';
import 'package:medx/utils/shared.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Security', style: context.textTheme.headlineMedium)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            gap(context),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'Face ID',
              value: true,
              onchanged: (p0) => {},
            ),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'Renenber me',
              value: true,
              onchanged: (p0) => {},
            ),
            Divider(color: Colors.grey[200]),
            CustomSwitchItem(
              title: 'Touch ID',
              value: false,
              onchanged: (p0) => {},
            ),
          ],
        ),
      ),
    );
  }
}
