import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/utils/constants.dart';

class InvitationButton extends StatelessWidget {
  const InvitationButton({
    super.key,
    required this.isInvited,
    this.onTap,
  });

  final bool isInvited;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isInvited ? null : onTap,
      child: Container(
        width: context.width * 0.2,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: isInvited
            ? ShapeDecoration(
                gradient: LinearGradient(
                    begin: Alignment(-0.71, 0.71),
                    end: Alignment(0.71, -0.71),
                    colors: [Color(0xFF2972FE), Color(0xFF6399FF)]),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)))
            : ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Color(0xFF4485FD)),
                  borderRadius: BorderRadius.circular(21),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x145A6CEA),
                    blurRadius: 50,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
        child: Text(isInvited ? 'Invited' : 'Invite',
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall
                ?.copyWith(color: isInvited ? Colors.white : kBlueColor)),
      ),
    );
  }
}
