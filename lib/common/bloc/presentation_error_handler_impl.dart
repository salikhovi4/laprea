import 'package:auto_route/auto_route.dart';
import 'package:common/bloc/bloc_news_handler.dart';
import 'package:common/bloc/news.dart';
import 'package:common/exception/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

final class BlocNewsHandlerImpl implements BlocNewsHandler {
  @override
  void onNewsReceived(BuildContext context, BlocNews news) {
    switch (news) {
      case ErrorBlocNews():
        _showError(context, news.errorMessage);
      case RetryErrorBlocNews():
        _showRepeatableError(context, news.errorMessage, news.retry);
    }
  }

  void _showError(BuildContext context, ErrorMessage error) {
      // Fluttertoast.showToast(
      //   msg: error.message,
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.TOP,
      //   backgroundColor: UiColors.primaryMeteorite,
      //   textColor: UiColors.primaryWhite,
      //   fontSize: 14,
      // );
      return;
  }

  void _showRepeatableError(BuildContext context, ErrorMessage error, VoidCallback onRepeatTap) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) {
          return _BaseBottomSheet(
            child: RepeatBottomSheet(
              errorMessage: error.message,
              errorCode: error.id,
              onCloseTap: () {
                AutoRouter.of(context).popForced();
              },
              onRepeatTap: () {
                AutoRouter.of(context).popForced();
                onRepeatTap();
              },
            ),
          );
        });
  }
}

class ErrorBottomSheet extends StatelessWidget {
  final String errorMessage;
  final String? errorCode;
  final VoidCallback onCloseTap;

  const ErrorBottomSheet({
    super.key,
    this.errorCode,
    required this.errorMessage,
    required this.onCloseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        Text(errorMessage),
        const Gap(24),
        UiButton(
          title: "Close",
          onPressed: onCloseTap,
        )
      ],
    );
  }
}

class RepeatBottomSheet extends StatelessWidget {
  final String errorMessage;
  final String? errorCode;
  final VoidCallback onCloseTap;
  final VoidCallback onRepeatTap;

  const RepeatBottomSheet({
    super.key,
    this.errorCode,
    required this.errorMessage,
    required this.onCloseTap,
    required this.onRepeatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        Text(
          errorMessage,
        ),
        const Gap(24),
        UiButton(
          title: "Try again",
          onPressed: onRepeatTap,
        ),
        const Gap(12),
        UiButton(
          title: "Close",
          onPressed: onCloseTap,
        )
      ],
    );
  }
}

class _BaseBottomSheet extends StatelessWidget {
  const _BaseBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Header(),
        const Gap(4),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
              left: 16, right: 16, top: 16, bottom: 16 + MediaQuery.paddingOf(context).bottom),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 26,
      decoration: const BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.all(Radius.circular(24))),
    );
  }
}
