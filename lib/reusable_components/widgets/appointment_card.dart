import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';

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
