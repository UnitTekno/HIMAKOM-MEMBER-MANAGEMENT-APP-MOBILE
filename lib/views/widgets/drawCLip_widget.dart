// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width - 180, size.height - 60.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx + 80, firstEndPoint.dy);
    var secondControlPoint =
        Offset(size.width - (size.width / 10), size.height - 90);
    var secondEndPoint = Offset(size.width + 40, size.height);
    path.quadraticBezierTo(secondControlPoint.dx + 40, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
