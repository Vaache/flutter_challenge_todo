import 'package:flutter/material.dart';

class InfoOverlayContent extends StatelessWidget {
  const InfoOverlayContent({super.key});

  @override
  Widget build(BuildContext context) {
    final contetnTextStyle = TextStyle(
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 15,
    );

    const contetnPadding = EdgeInsets.only(left: 28, right: 28, top: 38);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: .spaceBetween,
      children: [
        Padding(
          padding: contetnPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text('Designed by - ', style: contetnTextStyle),
              Text('Redesigned by - ', style: contetnTextStyle),
              Text('Illustrations - ', style: contetnTextStyle),
              Text('Icons - ', style: contetnTextStyle),
              Text('Font -', style: contetnTextStyle),
            ],
          ),
        ),
        Padding(
          padding: contetnPadding.copyWith(top: 0, bottom: 38),
          child: Center(child: Text('Made by', style: contetnTextStyle)),
        ),
      ],
    );
  }
}
