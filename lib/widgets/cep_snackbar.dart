import 'package:flutter/material.dart';

class CepSnackbar extends SnackBar {
  const CepSnackbar({
    super.key,
    required super.content,
    super.backgroundColor,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
    super.shape = const StadiumBorder(),
    super.behavior = SnackBarBehavior.floating,
    super.action,
    super.actionOverflowThreshold,
    super.showCloseIcon,
    super.closeIconColor,
    super.duration,
    super.animation,
    super.onVisible,
    super.dismissDirection,
    super.clipBehavior,
  });

  const CepSnackbar.success({
    super.key,
    required super.content,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
    super.shape = const StadiumBorder(),
    super.behavior = SnackBarBehavior.floating,
    super.action,
    super.actionOverflowThreshold,
    super.showCloseIcon,
    super.closeIconColor,
    super.duration,
    super.animation,
    super.onVisible,
    super.dismissDirection,
    super.clipBehavior,
  }) : super(backgroundColor: const Color(0xFF089768));

  const CepSnackbar.error({
    super.key,
    required super.content,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
    super.shape = const StadiumBorder(),
    super.behavior = SnackBarBehavior.floating,
    super.action,
    super.actionOverflowThreshold,
    super.showCloseIcon,
    super.closeIconColor,
    super.duration,
    super.animation,
    super.onVisible,
    super.dismissDirection,
    super.clipBehavior,
  }) : super(backgroundColor: const Color(0xFFC91A1A));
}
