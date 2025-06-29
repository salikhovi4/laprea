import 'package:flutter/material.dart';

class CertificatesMainWidget extends StatefulWidget {
  const CertificatesMainWidget({super.key});

  @override
  State<CertificatesMainWidget> createState() => _CertificatesMainWidgetState();
}

class _CertificatesMainWidgetState extends State<CertificatesMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Text('Certificates'))));
  }
}
