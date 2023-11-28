import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/reusable_components/widgets/favorite_doctor_card.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class TopDoctorsScreen extends StatefulWidget {
  const TopDoctorsScreen({Key? key}) : super(key: key);

  @override
  _TopDoctorsScreenState createState() => _TopDoctorsScreenState();
}

class _TopDoctorsScreenState extends State<TopDoctorsScreen> {
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
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: kBlueColor)),
                    SizedBox(width: context.width * 0.03),
                    Text('Top Doctor', style: context.textTheme.headlineMedium),
                    Spacer(),
                    CustomIconButton(icon: MedxIcons.filter, iconSize: 20, onTap: () {}),
                  ],
                ),
                gap(context),
                SizedBox(
                  height: context.height * 0.05,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: List.generate(
                          20,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: ActionChip(
                                  label: Text('all'),
                                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                                  side: BorderSide(color: kBlueColor, width: 2),
                                  labelStyle:
                                      context.textTheme.labelMedium?.copyWith(color: kBlueColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24)),
                                ),
                              ))),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              FavoriteDoctorCard(doctor: doctor.copyWith(isFavorite: true)),
              gap(context),
              FavoriteDoctorCard(doctor: doctor.copyWith(isFavorite: false)),
              gap(context),
              FavoriteDoctorCard(doctor: doctor.copyWith(isFavorite: true)),
              gap(context),
              FavoriteDoctorCard(doctor: doctor.copyWith(isFavorite: true)),
              gap(context),
              FavoriteDoctorCard(doctor: doctor.copyWith(isFavorite: false)),
            ],
          ),
        ),
      ),
    );
  }
}
