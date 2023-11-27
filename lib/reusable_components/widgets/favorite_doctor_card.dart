import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/ui/Appointments/doctor_profile_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/svg_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FavoriteDoctorCard extends StatefulWidget {
  const FavoriteDoctorCard({super.key, required this.doctor});

  final Doctor doctor;

  @override
  State<FavoriteDoctorCard> createState() => _FavoriteDoctorCardState();
}

class _FavoriteDoctorCardState extends State<FavoriteDoctorCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: DoctorProfileScreen(doctor: widget.doctor),
          withNavBar: false,
        );
      },
      child: Container(
        height: context.height * 0.12,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                borderRadius: BorderRadius.circular(12))),
        child: Row(
          children: [
            Container(
              width: context.height * 0.1,
              height: context.height * 0.12,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(widget.doctor.imagePath), fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
              ),
            ),
            SizedBox(width: context.width * 0.025),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.doctor.name, style: context.textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text("${widget.doctor.rating} (${widget.doctor.reviews} reviews)",
                          style: context.textTheme.titleSmall),
                    ],
                  ),
                  Text(widget.doctor.areaOfExpertise,
                      style: context.textTheme.labelSmall?.copyWith(color: Color(0xFF404345))),
                ],
              ),
            ),
            CustomIconButton(
                icon: MedxIcons.heart,
                onTap: () {
                  setState(() {
                    widget.doctor.isFavorite = !widget.doctor.isFavorite;
                  });
                },
                iconColor: widget.doctor.isFavorite ? null : kdarkblue),
            SizedBox(width: context.width * 0.025),
          ],
        ),
      ),
    );
  }
}
