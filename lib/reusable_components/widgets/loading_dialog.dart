import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pop(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.2),
      child: AlertDialog(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: SizedBox(
            width: 140,
            height: 140,
            child: Center(
                child: CircularProgressIndicator(
              strokeAlign: 10,
              strokeWidth: 6,
              backgroundColor: Colors.grey[200],
            ))),
      ),
    );
  }
}
