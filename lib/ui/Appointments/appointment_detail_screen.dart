import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_actionship.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({Key? key, required this.date}) : super(key: key);
  final String date;
  @override
  _AppointmentDetailScreenState createState() => _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  bool morningSelected = false;
  bool eveningSelected = false;
  String hourSelected = '';

  bool isVideoSession = false;
  bool isMessageSession = false;
  bool isVoiceSession = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment', style: context.textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.date, style: context.textTheme.bodyMedium),
              gap(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: CustomActionship(
                    title: 'Morning',
                    icon: Icons.sunny,
                    selected: morningSelected,
                    ontap: () {
                      setState(() {
                        morningSelected = true;
                        eveningSelected = false;
                      });
                    },
                  )),
                  SizedBox(width: 20),
                  Expanded(
                      child: CustomActionship(
                          title: 'Evening',
                          icon: Icons.light,
                          selected: eveningSelected,
                          ontap: () {
                            setState(() {
                              morningSelected = false;
                              eveningSelected = true;
                            });
                          })),
                ],
              ),
              gap(context),
              Text('choose the hour', style: context.textTheme.bodyMedium),
              gap(context),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  CustomActionship(
                    title: '09.00 AM',
                    selected: hourSelected == '09.00 AM',
                    enabled: morningSelected,
                    ontap: () => setState(() => hourSelected = '09.00 AM'),
                  ),
                  CustomActionship(
                    title: '10.00 AM',
                    selected: hourSelected == '10.00 AM',
                    enabled: morningSelected,
                    ontap: () => setState(() => hourSelected = '10.00 AM'),
                  ),
                  CustomActionship(
                    title: '11.00 AM',
                    selected: hourSelected == '11.00 AM',
                    enabled: morningSelected,
                    ontap: () => setState(() => hourSelected = '11.00 AM'),
                  ),
                  CustomActionship(
                    title: '13.00 PM',
                    selected: hourSelected == '13.00 PM',
                    enabled: eveningSelected,
                    ontap: () => setState(() => hourSelected = '13.00 PM'),
                  ),
                  CustomActionship(
                    title: '14.00 PM',
                    selected: hourSelected == '14.00 PM',
                    enabled: eveningSelected,
                    ontap: () => setState(() => hourSelected = '14.00 PM'),
                  ),
                  CustomActionship(
                    title: '15.00 PM',
                    selected: hourSelected == '15.00 PM',
                    enabled: eveningSelected,
                    ontap: () => setState(() => hourSelected = '15.00 PM'),
                  ),
                  CustomActionship(
                    title: '17.00 PM',
                    selected: hourSelected == '17.00 PM',
                    enabled: eveningSelected,
                    ontap: () => setState(() => hourSelected = '17.00 PM'),
                  ),
                  CustomActionship(
                    title: '18.00 PM',
                    selected: hourSelected == '18.00 PM',
                    enabled: eveningSelected,
                    ontap: () => setState(() => hourSelected = '18.00 PM'),
                  ),
                  CustomActionship(
                    title: '19.00 PM',
                    selected: hourSelected == '19.00 PM',
                    enabled: eveningSelected,
                    ontap: () => setState(() => hourSelected = '19.00 PM'),
                  ),
                ],
              ),
              gap(context),
              Text('fee information', style: context.textTheme.bodyMedium),
              gap(context),
              AppointmentTypeCard(
                discription: 'Can messaging with doctor',
                icon: Icons.message,
                isSelected: isMessageSession,
                price: 5,
                title: 'Nessaging',
                ontap: () => setState(() {
                  isVoiceSession = false;
                  isMessageSession = !isMessageSession;
                  isVideoSession = false;
                }),
              ),
              gap(context),
              AppointmentTypeCard(
                discription: 'Can make voice call with doctor',
                icon: Icons.message,
                isSelected: isVoiceSession,
                price: 10,
                title: 'Voice Call',
                ontap: () => setState(() {
                  isVoiceSession = !isVoiceSession;
                  isMessageSession = false;
                  isVideoSession = false;
                }),
              ),
              gap(context),
              AppointmentTypeCard(
                discription: 'Can make video call with doctor',
                icon: Icons.message,
                isSelected: isVideoSession,
                price: 15,
                title: 'Video call',
                ontap: () => setState(() {
                  isVoiceSession = false;
                  isMessageSession = false;
                  isVideoSession = !isVideoSession;
                }),
              ),
              gap(context),
              CustomButton(title: 'Next'),
              gap(context)
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentTypeCard extends StatelessWidget {
  const AppointmentTypeCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.discription,
    required this.icon,
    required this.price,
    this.ontap,
  });
  final bool isSelected;
  final String title, discription;
  final IconData icon;
  final int price;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: !isSelected
            ? ShapeDecoration(
                shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFEBEEF2)),
                borderRadius: BorderRadius.circular(16),
              ))
            : ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.71, 0.71),
                  end: Alignment(0.71, -0.71),
                  colors: [Color(0xFF2972FE), Color(0xFF6399FF)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: isSelected ? Colors.white : Color(0xFFEAF1FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                ),
                child: Icon(icon, size: 24, color: kBlueColor)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: context.textTheme.labelMedium
                          ?.copyWith(color: isSelected ? Colors.white : Colors.black)),
                  const SizedBox(height: 2),
                  SizedBox(
                      width: double.infinity,
                      child: Text(discription,
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: isSelected ? Colors.white : Colors.black))),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text('\$${price}',
                textAlign: TextAlign.right,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: isSelected ? Colors.white : kBlueColor)),
          ],
        ),
      ),
    );
  }
}
