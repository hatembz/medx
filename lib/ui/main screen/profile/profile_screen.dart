import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/buttons/custom_icon_button.dart';
import 'package:medx/reusable_components/widgets/logout_modal_sheet.dart';
import 'package:medx/reusable_components/widgets/profile_item_card.dart';
import 'package:medx/ui/main%20screen/profile/invite_friends_screen.dart';
import 'package:medx/ui/main%20screen/profile/permissions_screen.dart';
import 'package:medx/ui/main%20screen/profile/security_screen.dart';
import 'package:medx/utils/constants.dart';
import 'package:medx/utils/shared.dart';
import 'package:medx/utils/svg_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gap(context),
            gap(context),
            Row(children: [
              Image.asset('assets/icons/logoBlue.png', height: 34),
              SizedBox(width: 20),
              Text('Profile', style: context.textTheme.headlineMedium),
              Spacer(),
              CustomIconButton(icon: MedxIcons.edit, onTap: () {})
            ]),
            gap(context),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(clipBehavior: Clip.antiAlias, children: [
                  Container(
                    width: context.height * 0.09,
                    height: context.height * 0.09,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/doc_image1.png"), fit: BoxFit.fill),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: ShapeDecoration(
                          color: kBlueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(width: 2, color: Colors.white)),
                          shadows: [
                            BoxShadow(
                                color: Color(0x145A6CEA),
                                blurRadius: 50,
                                offset: Offset(0, 0),
                                spreadRadius: 0)
                          ],
                        ),
                        child: Icon(Icons.edit, color: Colors.white)),
                  )
                ]),
                const SizedBox(width: 28),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wido Studio', style: context.textTheme.labelMedium),
                      const SizedBox(height: 8),
                      Text('widostudio@gmail.com',
                          style: context.textTheme.labelMedium?.copyWith(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            gap(context),
            Divider(color: Colors.grey[200]),
            ProfileItemCard(
                title: 'Notification',
                icon: MedxIcons.bell,
                ontap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PermissionsScreen()))),
            Divider(color: Colors.grey[200]),
            ProfileItemCard(
                title: 'Security',
                icon: MedxIcons.lock,
                ontap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SecurityScreen()))),
            Divider(color: Colors.grey[200]),
            ProfileItemCard(
                title: 'Appearance',
                icon: MedxIcons.eye,
                ontap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SecurityScreen()))),
            Divider(color: Colors.grey[200]),
            ProfileItemCard(title: 'Help', icon: MedxIcons.warning),
            Divider(color: Colors.grey[200]),
            ProfileItemCard(
                title: 'invite Freinds',
                icon: MedxIcons.patients,
                ontap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => InviteFriendsScreen()))),
            Divider(color: Colors.grey[200]),
            ProfileItemCard(
              title: 'Logout',
              icon: MedxIcons.logout,
              isLogout: true,
              ontap: () {
                showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    builder: (context) => LogoutMoalSheet());
              },
            )
          ],
        ),
      ),
    );
  }
}
