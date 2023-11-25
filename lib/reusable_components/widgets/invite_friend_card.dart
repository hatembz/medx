import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/invitation_button.dart';

class InviteFriendCard extends StatelessWidget {
  const InviteFriendCard({
    super.key,
    required this.isInvited,
  });

  final bool isInvited;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFDADADA)),
              borderRadius: BorderRadius.circular(12))),
      child: Row(
        children: [
          Container(
            width: context.height * 0.09,
            height: context.height * 0.08,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/doc_image2.png"), fit: BoxFit.fill),
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            ),
          ),
          SizedBox(width: context.width * 0.025),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dr. Eleanor Pena', style: context.textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text('+213 5648-756-458',
                    style: context.textTheme.labelSmall?.copyWith(color: Color(0xFF221F1F))),
              ],
            ),
          ),
          InvitationButton(isInvited: isInvited),
          SizedBox(width: context.width * 0.025),
        ],
      ),
    );
  }
}
