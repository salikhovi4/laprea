import 'package:flutter/material.dart';
import 'package:laprea/ui_kit/theme/theme.dart';
import 'package:laprea/ui_kit/theme/theme_extension.dart';

enum UiButtonSize { small, medium, large }

extension UiButtonSizeExtension on UiButtonSize {
  double get height {
    switch (this) {
      case UiButtonSize.large:
        return 48;
      case UiButtonSize.medium:
        return 42;
      case UiButtonSize.small:
        return 32;
    }
  }

  double get width => double.infinity;

  /// Размер лоадера
  double get loaderSize => switch (this) {
    UiButtonSize.large => 24,
    UiButtonSize.medium => 18,
    UiButtonSize.small => 16,
  };

  /// Стили текста в зависимости от размера кнопки
  // TextStyle getTextStyle(AppStyle textTheme) => switch (this) {
  //   UiButtonSize.small => textTheme.textSBold,
  //   UiButtonSize.medium => textTheme.textXsBold,
  //   UiButtonSize.large => textTheme.textSmBold,
  // };
}

enum UiButtonType {
  primary,
  secondary,
  secondaryQuartz,
  primaryFullRounded,
  whiteFullRounded,
}

enum UiButtonState { enabled, disabled, loading }

extension UiButtonStateExtension on UiButtonState {
  bool get isLoading => this == UiButtonState.loading;

  bool get isDisabled => this == UiButtonState.disabled;
}

// Snippet использования виджета
/// ```dart
/// const btn1 = UiButton(
///   isFullWidth: false,
///   title: '+',
///   icon: UiIcon(UiAssets.cart24, color: Colors.white),
/// );
/// const btn2 = Row(
///   children: [
///     UiButton(isInsideRowOrFlex: true, title: 'Base in row, large'),
///     Gap(10),
///     UiButton(isInsideRowOrFlex: true, title: 'Base in row, small', size: UiButtonSize.medium),
///   ],
/// );
/// ```
class UiButton extends StatefulWidget {
  /// Виджет корпоративной кнопки
  const UiButton({
    required this.title,
    super.key,
    this.icon,
    this.width,
    this.onPressed,
    this.size = UiButtonSize.large,
    this.type = UiButtonType.primary,
    this.state = UiButtonState.enabled,
    this.isFullWidth = true,
    this.customBackgroundColor,
    this.customPadding,
    this.textStyle,
  });

  /// Состояние кнопки, active, disabled
  final UiButtonState state;

  /// Тип кнопки, primary, secondary, textButton
  final UiButtonType type;

  /// Вариант размера кнопки, small, medium, large
  final UiButtonSize size;

  /// Текст кнопки
  final String title;

  /// Виджет иконки для текстовой кнопки
  final Widget? icon;

  /// Кастомная ширина кнопки.
  final double? width;

  /// Действие, которое выполнится по нажатию на кнопку
  final VoidCallback? onPressed;

  /// Флаг означающий что кнопка по умолчанию занимает всю ширину родителя
  final bool isFullWidth;

  /// Кастомный цвет фона кнопки
  final Color? customBackgroundColor;

  /// Кастомный паддинг между контентом кнопки и ее границами
  final EdgeInsets? customPadding;

  /// Стили текста внутри кнопки
  final TextStyle? textStyle;

  @override
  State<UiButton> createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  Color? _foregroundColor;
  Color _backgroundColor = UiColors.accent;
  double _radius = 100;
  double _verticalPaddings = 16;
  double _horizontalPaddings = 24;

  UiButtonState get state => widget.state;

  @override
  void initState() {
    super.initState();

    if (widget.size == UiButtonSize.small) {
      _verticalPaddings = 8;
      _horizontalPaddings = 18;
    }

    switch (widget.type) {
      case UiButtonType.primary:
        _backgroundColor = UiColors.accent;
        _foregroundColor = Colors.white;
      case UiButtonType.secondary:
        _backgroundColor = Colors.transparent;
        _foregroundColor = Colors.white;
        _verticalPaddings = 15;
      case UiButtonType.secondaryQuartz:
        _backgroundColor = UiColors.accent;
        _foregroundColor = Colors.white;
      case UiButtonType.primaryFullRounded:
        _backgroundColor = UiColors.accent;
        _foregroundColor = Colors.white;
        _radius = 24;
      case UiButtonType.whiteFullRounded:
        _backgroundColor = UiColors.accent;
        _foregroundColor = Colors.white;
        _radius = 24;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor =
        widget.textStyle?.color ??
        context.themePrimaryColor.withValues(alpha: state.isDisabled ? 0.4 : 1);
    return ElevatedButton(
      onPressed: state.isLoading || state.isDisabled ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        fixedSize: Size.fromHeight(widget.size.height),
        padding:
            widget.customPadding ??
            EdgeInsets.symmetric(
              horizontal: _horizontalPaddings,
              vertical: _verticalPaddings,
            ),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
          side: BorderSide(
            width: widget.type == UiButtonType.secondary ? 1 : 0,
            color: UiColors.accentSecondary,
          ),
        ),
        // textStyle: widget.textStyle ?? widget.size.getTextStyle(textTheme).copyWith(color: textColor),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: widget.textStyle,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((widgetState) {
          if (widgetState.contains(WidgetState.pressed)) {
            return widget.customBackgroundColor?.withValues(alpha: 0.6) ??
                _foregroundColor;
          }

          return (widget.customBackgroundColor ?? _backgroundColor).withValues(
            alpha: state.isDisabled ? 0.4 : 1,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((state) {
          if (state.contains(WidgetState.disabled)) {
            return textColor.withValues(alpha: 0.4);
          }
          return textColor;
        }),
        overlayColor: WidgetStateProperty.all<Color?>(Colors.transparent),
        surfaceTintColor: WidgetStateProperty.resolveWith<Color?>(
          (_) => Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state.isLoading)
            SizedBox(
              width: widget.size.loaderSize,
              height: widget.size.loaderSize,
              child: CircularProgressIndicator(
                color: context.themePrimaryColor,
                strokeWidth: 3,
              ),
            )
          else
            Text(widget.title),
        ],
      ),
    );
  }
}
