import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/reusable_components/inputs/custom_search_bar.dart';
import 'package:medx/reusable_components/widgets/medical_specialty_detailed.dart';
import 'package:medx/ui/home/favorite_doctor_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class SpecialistDoctorScreeen extends StatefulWidget {
  const SpecialistDoctorScreeen({Key? key}) : super(key: key);

  @override
  _SpecialistDoctorScreeenState createState() => _SpecialistDoctorScreeenState();
}

class _SpecialistDoctorScreeenState extends State<SpecialistDoctorScreeen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(context.height * 0.2),
          child: Padding(
            padding: EdgeInsets.only(top: context.height * 0.02, right: 24, left: 24),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, color: kBlueColor)),
                    SizedBox(width: context.width * 0.03),
                    Text('Specialist Doctor', style: context.textTheme.headlineMedium),
                    Spacer(),
                    CustomIconButton(
                        icon: MedxIcons.filter,
                        iconSize: 20,
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FavoriteDoctorScreen()))),
                  ],
                ),
                gap(context),
                CustomSearchBar(controller: TextEditingController())
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Wrap(alignment: WrapAlignment.start, spacing: 20, runSpacing: 20, children: [
              MedicalSpecialtyDetailed(
                icon: MedxIcons.consultation,
                backgroundColor: Color(0xFF4485FD),
                title: 'Consultation',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.teeth,
                backgroundColor: Color(0xFFA584FF),
                title: 'Dental',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.heart_1,
                backgroundColor: Color(0xFFFF7854),
                title: 'Heart',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.clinic,
                backgroundColor: Color(0xFFFDA625),
                title: 'Hospitals',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.medicine,
                backgroundColor: Color(0xFF00CC6A),
                title: 'Medicines',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.care,
                backgroundColor: Color(0xFF00C9E4),
                title: 'Physician',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.bandage,
                backgroundColor: Color(0xFFFD44B3),
                title: 'Skin',
                discription: '265 doctor',
              ),
              MedicalSpecialtyDetailed(
                icon: MedxIcons.syringe,
                backgroundColor: Color(0xFFFD4444),
                title: 'Surgeon',
                discription: '265 doctor',
              )
            ]),
          ),
        ),
      ),
    );
  }
}
