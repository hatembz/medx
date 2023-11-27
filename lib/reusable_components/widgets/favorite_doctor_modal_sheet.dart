import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/models/doctor_model.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/widgets/favorite_doctor_card.dart';
import 'package:medx/utils/shared.dart';

class FavoriteMoalSheet extends StatelessWidget {
  const FavoriteMoalSheet({
    super.key,
    required this.doctor,
  });
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FavoriteDoctorCard(
            doctor: doctor,
          ),
          gap(context),
          Text('Remove From favorite',
              textAlign: TextAlign.center, style: context.textTheme.bodyMedium),
          gap(context),
          gap(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(fixedSize: Size(context.width * 0.4, 55)),
                  child: Text('cancel')),
              CustomButton(
                title: 'Yes,Remove',
                width: context.width * 0.4,
                onTap: () => Navigator.pop(context),
              )
            ],
          )
        ],
      ),
    );
  }
}
