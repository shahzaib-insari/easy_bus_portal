import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class background extends StatelessWidget {
  final Widget child;
  const background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   child: Image.network(
          //       'https://png.pngtree.com/element_our/20200610/ourmid/pngtree-blue-particle-technology-graphics-image_2249352.png'),
          //   width: size.width * 0.3,
          // ),
          child,
        ],
      ),
    );
  }
}
