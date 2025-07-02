import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class ProfileVisitsWidget extends StatefulWidget {
  const ProfileVisitsWidget({super.key});

  @override
  State<ProfileVisitsWidget> createState() => _ProfileVisitsWidgetState();
}

class _ProfileVisitsWidgetState extends State<ProfileVisitsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeBgColor,
      body: SafeArea(
        child: Column(
          children: [
            UiAppBar(title: 'Мои посещения'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Здесь будут храниться все ваши посещения. Пока у вас не было посещений.',
                    style: context.textBaseMedium(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
