import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum UiIconSize {
  small,
  medium,
  large,
}

extension UiIconSizeExtension on UiIconSize {
  double get dimension {
    return switch (this) {
      UiIconSize.small => 16,
      UiIconSize.medium => 20,
      UiIconSize.large => 24,
    };
  }
}

/// https://www.figma.com/file/PDPCKRn6pVnsxvQGh4EgCk/Components?node-id=6%3A822&mode=dev
/// Виджет отображения корпоративных иконок
class UiIcon extends StatelessWidget {
  const UiIcon(
      this.assetPath, {
        super.key,
        this.color,
        this.height,
        this.width,
        this.box,
        this.packageOverride,
        this.fit = BoxFit.contain,
        this.size = UiIconSize.medium,
      });

  /// путь до иконки из файла ui_kit/resources/ui_assets.dart - используем класс [UiAssets]
  final String assetPath;

  /// кастомный цвет иконки взамен дефолтного
  final Color? color;

  /// кастомная высота иконки
  final double? height;

  /// Кастомная ширина иконки
  final double? width;

  /// Если нужно использовать [assetPath] из внешнего модуля, когда файл изображения находится вне UI Kit.
  final String? packageOverride;

  /// поведение встраивания иконки в родительский блок
  final BoxFit fit;

  /// Относительный размер иконки
  final UiIconSize size;

  /// Если ширина равна высоте
  final double? box;

  @override
  Widget build(BuildContext context) {
    Widget buildIcon() => SvgPicture.asset(
      assetPath,
      colorFilter: color != null ? ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn) : null,
      width: box ?? width ?? size.dimension,
      height: box ?? height ?? size.dimension,
      fit: fit,
    );
    return buildIcon();
  }
}
