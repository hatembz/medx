import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_actionship.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/inputs/custom_text_field.dart';
import 'package:medx/ui/home/home_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen(
      {Key? key,
      required this.chosenHour,
      required this.appointmentdate,
      required this.appointmentType})
      : super(key: key);
  final String chosenHour;
  final String appointmentdate;
  final AppointmentType appointmentType;
  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  String gender = '';
  String selectedRange = '';
  List<bool> ship = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ptient Details', style: context.textTheme.headlineMedium)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomButton(
          title: 'next',
          onTap: () {
            if ((formkey.currentState?.validate() ?? false) && gender != '' && selectedRange != '')
              showDialog(context: context, builder: (context) => AppointmentBookingStatusDialog());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('full Name', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                    hintText: 'Full Name',
                    controller: nameController,
                    validator: (value) {
                      if (nameController.text == '' || nameController.text.length < 3)
                        return 'enter name';
                      return null;
                    }),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Select your age', style: context.textTheme.displaySmall),
                ),
                SizedBox(
                  height: context.height * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      CustomActionship(
                          title: '1-17',
                          selected: ship.first,
                          ontap: () => setState(() {
                                selectedRange = '1-17';
                                ship.fillRange(0, 4, false);

                                ship[0] = true;
                              })),
                      SizedBox(width: 12),
                      CustomActionship(
                        title: '18-24',
                        selected: ship[1],
                        ontap: () => setState(() {
                          selectedRange = '18-24';
                          ship.fillRange(0, 4, false);

                          ship[1] = true;
                        }),
                      ),
                      SizedBox(width: 12),
                      CustomActionship(
                        title: '25-45',
                        selected: ship[2],
                        ontap: () => setState(() {
                          selectedRange = '25-45';
                          ship.fillRange(0, 4, false);

                          ship[2] = true;
                        }),
                      ),
                      SizedBox(width: 12),
                      CustomActionship(
                        title: '46-70',
                        selected: ship[3],
                        ontap: () => setState(() {
                          selectedRange = '46-70';
                          ship.fillRange(0, 4, false);

                          ship[3] = true;
                        }),
                      ),
                      SizedBox(width: 12),
                      CustomActionship(
                        title: '+70',
                        selected: ship[4],
                        ontap: () => setState(() {
                          selectedRange = '+70';
                          ship.fillRange(0, 4, false);

                          ship[4] = true;
                        }),
                      ),
                    ],
                  ),
                ),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Phone Number', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                  hintText: 'phone number',
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.length < 10) return 'enter valid phone';
                    return null;
                  },
                ),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('Gender', style: context.textTheme.displaySmall),
                ),
                DropdownButtonFormField<String>(
                  style: context.textTheme.displaySmall,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                    hintText: "male",
                    hintStyle: TextStyle(
                        color: Color(0xFFDADADA), fontSize: 18, fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Color(0xffDADADA), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: kBlueColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Color(0xffDADADA), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: kRedColor, width: 2)),
                  ),
                  items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      enabled: true,
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    gender = value ?? '';
                  },
                ),
                gap(context),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 8),
                  child: Text('write your Problem', style: context.textTheme.displaySmall),
                ),
                CustomTextField(
                  hintText: 'Tell doctor abour your problem',
                  maxLines: 7,
                  controller: problemController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'add your problem';
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentBookingStatusDialog extends StatelessWidget {
  const AppointmentBookingStatusDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          gap(context),
          gap(context),
          Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.71, 0.71),
                  end: Alignment(0.71, -0.71),
                  colors: [kBlueColor, Color(0xFF6399FF)],
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                shadows: [
                  BoxShadow(color: Color(0x992871FE), blurRadius: 52, offset: Offset(0, 4))
                ],
              ),
              child: Icon(
                Icons.message,
                size: 48,
                color: Colors.white,
              )),
          gap(context),
          gap(context),
          Text('Well Done', style: context.textTheme.headlineMedium?.copyWith(color: kBlueColor)),
          gap(context),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'You appointment booking successfully completed . ',
                    style: context.textTheme.displaySmall),
                TextSpan(text: 'Dr.seddik walid', style: context.textTheme.bodyMedium),
                TextSpan(text: ' will Message you soon', style: context.textTheme.displaySmall),
              ],
            ),
          ),
          gap(context),
          CustomButton(
            title: 'back to home',
            onTap: () => Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false),
          )
        ],
      ),
    );
  }
}
