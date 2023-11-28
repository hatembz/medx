import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_actionship.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/widgets/appointment_card.dart';
import 'package:medx/ui/Appointments/Patient_details_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';

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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Text('fee information', style: context.textTheme.bodyMedium),
              SizedBox(height: 10),
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
              CustomButton(
                title: 'Next',
                enabled: (isMessageSession || isVideoSession || isVoiceSession) &&
                    (eveningSelected || morningSelected) &&
                    hourSelected != '',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientDetailsScreen(
                                chosenHour: hourSelected,
                                appointmentdate: widget.date,
                                appointmentType: isMessageSession
                                    ? AppointmentType.message
                                    : isVideoSession
                                        ? AppointmentType.videoCall
                                        : AppointmentType.voiceCall,
                              )));
                },
              ),
              gap(context)
            ],
          ),
        ),
      ),
    );
  }
}
