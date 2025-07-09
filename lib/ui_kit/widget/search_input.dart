import 'package:flutter/material.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: SizedBox(
        height: 56,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.only(left: 20, right: 20),
            hintText: S.of(context).search,
            hintStyle: context.textBaseRegular().copyWith(
              color: UiColors.stoneGray,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: UiIcon(UiAssets.search, width: 24, height: 24),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 10.0,
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(28.0),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 10.0,
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(28.0),
            ),
            errorBorder: OutlineInputBorder(
              gapPadding: 10.0,
              borderSide: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(28.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              gapPadding: 10.0,
              borderSide: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(28.0),
            ),
          ),
        ),
      ),
    );
  }
}
