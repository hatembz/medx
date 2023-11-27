import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/reusable_components/widgets/doctor_milestone.dart';
import 'package:medx/ui/Appointments/appointment_detail_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';
import 'package:intl/intl.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  DateTime? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: kBlueColor)),
                    SizedBox(width: context.width * 0.03),
                    Text(widget.doctor.name, style: context.textTheme.headlineMedium),
                    Spacer(),
                    CustomIconButton(
                        icon: MedxIcons.heart,
                        onTap: () {},
                        iconColor: widget.doctor.isFavorite ? kBlueColor : kdarkblue),
                    SizedBox(width: 20),
                    CustomIconButton(icon: Icons.share, onTap: () {}),
                    SizedBox(width: 10)
                  ],
                ),
                gap(context),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(widget.doctor.imagePath,
                        height: 120, width: 120, fit: BoxFit.fill)),
                gap(context),
                Text(widget.doctor.name,
                    style: context.textTheme.labelSmall
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20)),
                gap(context),
                Text(widget.doctor.areaOfExpertise,
                    style: context.textTheme.labelSmall
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
                gap(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DoctorMilestone(
                      doctor: widget.doctor,
                      color: Color(0x267ACEFA),
                      icon: Icon(MedxIcons.patients, color: Color(0xff7ACEFA)),
                      discription: 'Patients',
                      title: '${widget.doctor.totalPatients}',
                    ),
                    DoctorMilestone(
                      doctor: widget.doctor,
                      color: Color(0xFFFDF1F3),
                      icon: Icon(MedxIcons.experiance, color: Color(0xffE8899E)),
                      discription: 'Experience',
                      title: "${widget.doctor.yearsOfExperience}",
                    ),
                    DoctorMilestone(
                      doctor: widget.doctor,
                      color: Color(0xffFEF6EC),
                      icon: Icon(Icons.star_border, color: Color(0xffF7C480)),
                      discription: 'Ratingts',
                      title: "${widget.doctor.rating}",
                    ),
                  ],
                ),
                gap(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('About Doctor',
                      style: context.textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
                ),
                Text(
                  'Dr. Bellamy Nicholas is a top specialist at London Bridge Hospital at London. He has achieved several awards and recognition for is contribution and service in his own field. He is available for private consultation. ',
                  style: TextStyle(
                      color: Color(0xFF6A769A), fontSize: 14, fontWeight: FontWeight.w600),
                ),
                gap(context),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Make Appointement',
                      style: context.textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
                ),
                DatePicker(
                  DateTime.now(),
                  height: context.height * 0.11,
                  // initialSelectedDate: DateTime.now(),

                  selectionColor: kBlueColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
                gap(context),
                CustomButton(
                  title: 'Book Appointment',
                  enabled: _selectedValue != null,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailScreen(
                              date: DateFormat('EEEE, MMMM dd yyyy').format(_selectedValue!)),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
