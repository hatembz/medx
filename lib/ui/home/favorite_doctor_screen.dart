import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/reusable_components/inputs/custom_search_bar.dart';
import 'package:medx/reusable_components/widgets/decorated_card.dart';
import 'package:medx/reusable_components/widgets/favorite_doctor_modal_sheet.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class FavoriteDoctorScreen extends StatefulWidget {
  const FavoriteDoctorScreen({Key? key}) : super(key: key);

  @override
  _FavoriteDoctorScreenState createState() => _FavoriteDoctorScreenState();
}

class _FavoriteDoctorScreenState extends State<FavoriteDoctorScreen> {
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
                      Text('Favorite Doctor', style: context.textTheme.headlineMedium),
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
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  DoctorCard(
                    isOnline: true,
                    rating: 4.5,
                    title: "DR.Bellamy N",
                    reviews: 135,
                    specialty: "viralogist",
                    hasHeart: true,
                    ontap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => FavoriteMoalSheet(doctor: doctor),
                    ),
                  ),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                  DoctorCard(
                      isOnline: true,
                      rating: 4.5,
                      title: "DR.Bellamy N",
                      reviews: 135,
                      specialty: "viralogist",
                      hasHeart: true),
                ],
              ),
            ),
          )),
    );
  }
}
