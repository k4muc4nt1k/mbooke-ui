import 'package:flutter/material.dart';

class MBButton extends StatefulWidget {
  const MBButton(
      {super.key,
      required this.onPressed,
      this.textColor,
      this.color,
      this.text = "CLButton",
      this.iconLabel,
      this.borderRadius = 20,
      this.borderSize = 1,
      this.borderColor,
      this.isBottomBorder = false,
      this.width,
      this.height = 42,
      this.paddingHorizontalSize,
      this.paddingVerticalSize});

  final Function() onPressed;
  final Color? textColor;
  final Color? color;
  final String text; //
  final Widget? iconLabel;
  final double borderRadius; //
  final double borderSize; //
  final Color? borderColor;
  final bool isBottomBorder; //
  final double? width;
  final double height; //
  final double? paddingHorizontalSize;
  final double? paddingVerticalSize;

  @override
  State<MBButton> createState() => _MBButtonState();
}

class _MBButtonState extends State<MBButton> {
  @override
  Widget build(BuildContext context) {
    return (widget.width == null)
        ? Row(
            children: [
              Expanded(
                  child: _mbButtonFixSize(
                      onPressed: widget.onPressed,
                      color: widget.color,
                      borderColor: widget.borderColor,
                      height: widget.height,
                      barderRadius: widget.borderRadius,
                      borderSize: widget.borderSize,
                      iconLabel: widget.iconLabel,
                      text: widget.text,
                      textColor: widget.textColor,
                      width: widget.width,
                      isBottomBorder: widget.isBottomBorder))
            ],
          )
        : _mbButtonFixSize(
            onPressed: widget.onPressed,
            color: widget.color,
            borderColor: widget.borderColor,
            borderSize: widget.borderSize,
            height: widget.height,
            barderRadius: widget.borderRadius,
            iconLabel: widget.iconLabel,
            text: widget.text,
            textColor: widget.textColor,
            width: widget.width,
            isBottomBorder: widget.isBottomBorder);
  }

  Widget _mbButtonFixSize(
      {required Function() onPressed,
      Color? textColor,
      Color? color,
      String text = "CLButton",
      double barderRadius = 20,
      Color? borderColor,
      Widget? iconLabel,
      double? width,
      double height = 42,
      double? paddingHorizontalSize,
      double? paddingVerticalSize,
      bool isBottomBorder = false,
      double borderSize = 1}) {
    Decoration decoration = BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(barderRadius)),
        border: borderColor != null
            ? Border.all(color: borderColor, width: borderSize)
            : null);
    if (isBottomBorder) {
      decoration = BoxDecoration(
          color: color,
          // borderRadius: BorderRadius.all(Radius.circular(barderRadius)),
          border: borderColor != null
              ? Border(
                  bottom: BorderSide(color: borderColor, width: borderSize))
              : null);
    }

    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: decoration,
        child: MaterialButton(
          padding: paddingHorizontalSize == null || paddingVerticalSize == null
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(
                  horizontal: paddingHorizontalSize,
                  vertical: paddingVerticalSize),
          onPressed: onPressed,
          textColor: textColor,
          height: height,
          child: iconLabel ??
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
        ));
  }
}

//
