import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SqTileBtn extends StatelessWidget {
  final String logoPath;
  final double height;
  final double width;
  final String label;
  final double padd;
  final Function()? onPress;

  const SqTileBtn(
      {required this.logoPath,
      required this.height,
      required this.width,
      required this.label,
      required this.padd,
      required this.onPress,
      super.key});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          side: WidgetStateProperty.all(BorderSide.none),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          fixedSize: WidgetStateProperty.all(Size(width, height))),
      onPressed: onPress,
      child: Container(
        padding: EdgeInsets.all(padd),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.surface),
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        height: height,
        width: width,
        child: SvgPicture.asset(
          logoPath,
          semanticsLabel: label,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
