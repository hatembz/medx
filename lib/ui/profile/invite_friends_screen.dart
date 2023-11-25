import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medx/reusable_components/widgets/invite_friend_card.dart';
import 'package:medx/utils/shared.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  @override
  _InviteFriendsScreenState createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  // bool isInvited = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('invite Friends', style: context.textTheme.headlineMedium)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            InviteFriendCard(isInvited: false),
            gap(context),
            InviteFriendCard(isInvited: true),
            gap(context),
            InviteFriendCard(isInvited: false),
            gap(context),
            InviteFriendCard(isInvited: true),
            gap(context),
            InviteFriendCard(isInvited: true),
            gap(context),
            InviteFriendCard(isInvited: false),
            gap(context),
            InviteFriendCard(isInvited: false),
            gap(context),
            InviteFriendCard(isInvited: true),
            gap(context),
            InviteFriendCard(isInvited: false),
            gap(context),
          ],
        ),
      ),
    );
  }
}
