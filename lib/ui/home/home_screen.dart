import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gap(context),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/logoBlue.png', width: 35, height: 35),
              SizedBox(width: context.width * 0.03),
              Expanded(
                child: SizedBox(
                  child: Text('Doctorek', style: context.textTheme.headlineMedium),
                ),
              ),
              Spacer(),
              Container(
                  width: context.height * 0.05,
                  height: context.height * 0.05,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: kdarkblue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Icon(MedxIcons.bell, size: 18, color: kBlueColor)),
              const SizedBox(width: 16),
              Container(
                  width: context.height * 0.05,
                  height: context.height * 0.05,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: kdarkblue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Icon(MedxIcons.heart, size: 18, color: kBlueColor)),
            ],
          ),
          gap(context),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Find',
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400)),
              TextSpan(
                  text: ' Your doctor',
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w400, color: Colors.grey))
            ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SearchBar(
              hintText: 'Search',
              // shadowColor: MaterialStatePropertyAll(),
              surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.grey),
              side: MaterialStatePropertyAll(BorderSide(width: 1, color: Color(0xFFEAEEF2))),
              elevation: MaterialStatePropertyAll<double>(0),
              controller: controller,
              constraints: BoxConstraints(maxHeight: 50, minHeight: 50),
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              // onTap: () => controller.openView(),
              // onChanged: (_) => controller.openView(),
              trailing: [const Icon(Icons.search)],
            ),
          ),
          gap(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Special Doctor', style: context.textTheme.bodyMedium),
              TextButton(
                  onPressed: () {},
                  child: Text('View All',
                      style: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)))
            ],
          ),
          gap(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Doctor', style: context.textTheme.bodyMedium),
              TextButton(
                  onPressed: () {},
                  child: Text('View All',
                      style: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)))
            ],
          ),
          gap(context),
          Container(
            width: 160,
            height: 200,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFDADADA)),
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 60,
                      offset: Offset(0, 10),
                      spreadRadius: 0)
                ]),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    )));
  }
}
