import 'package:flutter/material.dart';
import 'package:medx/ui/auth/signin_screen.dart';
import 'package:medx/reusable_components/buttons/custom_button.dart';
import 'package:medx/reusable_components/inputs/custom_text_field.dart';
import 'package:medx/reusable_components/widgets/loading_dialog.dart';
import 'package:medx/utils/shared.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('reset Password', style: Theme.of(context).textTheme.headlineMedium)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap(context),
            Text('create new password', style: Theme.of(context).textTheme.labelSmall),
            gap(context),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text('New Password', style: Theme.of(context).textTheme.displaySmall),
            ),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
              suffixIcon: Icons.remove_red_eye,
            ),
            gap(context),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text('Confirme New Password', style: Theme.of(context).textTheme.displaySmall),
            ),
            CustomTextField(
              hintText: 'Password',
              obscureText: true,
              suffixIcon: Icons.remove_red_eye,
            ),
            Spacer(),
            CustomButton(
              title: 'continue',
              onTap: () {
                showDialog(context: context, builder: (context) => LoadingDialog()).then((value) =>
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SigninScreen())));
              },
            ),
            gap(context),
            gap(context),
          ],
        ),
      ),
    );
  }
}
