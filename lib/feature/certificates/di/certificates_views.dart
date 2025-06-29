import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/certificates/presentation/main/certificates_main_widget.dart';

@RoutePage(name: 'CertificatesRouteRoot')
class CertificatesRoute extends StatelessWidget {
  const CertificatesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage(name: 'CertificatesMainRoute')
class CertificatesMainScreen extends StatelessWidget {
  const CertificatesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CertificatesMainWidget();
  }
}
