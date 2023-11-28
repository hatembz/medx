import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/reusable_components/inputs/custom_search_bar.dart';
import 'package:medx/reusable_components/widgets/decorated_card.dart';
import 'package:medx/ui/Appointments/doctor_profile_screen.dart';
import 'package:medx/ui/main%20screen/home/favorite_doctor_screen.dart';
import 'package:medx/ui/main%20screen/home/notification_screen.dart';
import 'package:medx/ui/main%20screen/home/specialist_doctor_screeen.dart';
import 'package:medx/ui/main%20screen/home/top_doctors_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(context.height * 0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/logoBlue.png', width: 35, height: 35),
                    SizedBox(width: context.width * 0.03),
                    Text('Doctorek', style: context.textTheme.headlineMedium),
                    Spacer(),
                    CustomIconButton(
                        icon: MedxIcons.bell,
                        iconSize: 20,
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NotificationScreen()))),
                    const SizedBox(width: 16),
                    CustomIconButton(
                        icon: MedxIcons.heart,
                        iconSize: 20,
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FavoriteDoctorScreen()))),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gap(context),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Find',
                            style: context.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' Your doctor',
                            style: context.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w400, color: Colors.grey))
                      ])),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: CustomSearchBar(controller: controller)),
                    gap(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Special Doctor', style: context.textTheme.bodyMedium),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SpecialistDoctorScreeen()));
                            },
                            child: Text('View All',
                                style: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)))
                      ],
                    ),
                    Center(
                      child: Wrap(
                        spacing: context.width * 0.08,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: medicalSpecialties,
                      ),
                    ),
                    gap(context),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Top Doctor', style: context.textTheme.bodyMedium),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => TopDoctorsScreen()));
                          },
                          child: Text('View All',
                              style: context.textTheme.bodyMedium?.copyWith(color: kBlueColor)))
                    ]),
                    SizedBox(
                      height: context.height * 0.26,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10),
                          children: [
                            DoctorCard(
                                isOnline: true,
                                rating: 4.5,
                                title: "DR.Bellamy N",
                                reviews: 135,
                                specialty: "viralogist",
                                ontap: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: DoctorProfileScreen(doctor: doctor),
                                      withNavBar: false,
                                    )),
                            SizedBox(width: 20),
                            DoctorCard(
                                isOnline: true,
                                rating: 4.5,
                                title: "DR.Bellamy N",
                                reviews: 135,
                                specialty: "viralogist",
                                ontap: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: DoctorProfileScreen(doctor: doctor),
                                      withNavBar: false,
                                    )),
                            SizedBox(width: 20),
                            DoctorCard(
                                isOnline: true,
                                rating: 4.5,
                                title: "DR.Bellamy N",
                                reviews: 135,
                                specialty: "viralogist",
                                ontap: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: DoctorProfileScreen(doctor: doctor),
                                      withNavBar: false,
                                    )),
                            SizedBox(width: 20),
                            DoctorCard(
                                isOnline: true,
                                rating: 4.5,
                                title: "DR.Bellamy N",
                                reviews: 135,
                                specialty: "viralogist",
                                ontap: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: DoctorProfileScreen(doctor: doctor),
                                      withNavBar: false,
                                    )),
                            SizedBox(width: 20),
                            DoctorCard(
                                isOnline: false,
                                rating: 4.5,
                                title: "DR.Bellamy N",
                                reviews: 135,
                                specialty: "viralogist",
                                ontap: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: DoctorProfileScreen(doctor: doctor),
                                      withNavBar: false,
                                    )),
                            SizedBox(width: 20),
                            DoctorCard(
                                isOnline: true,
                                rating: 4.5,
                                title: "DR.Bellamy N",
                                reviews: 135,
                                specialty: "viralogist",
                                ontap: () => PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: DoctorProfileScreen(doctor: doctor),
                                      withNavBar: false,
                                    )),
                          ]),
                    )
                  ],
                ),
              ),
            )));
  }
}
