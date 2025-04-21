import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:real_estate_app/constants.dart';

class TextOnWidget extends StatelessWidget {
  final String text;


     TextOnWidget({super.key, required this.text,});

  final paint = Paint()
    ..color =  Colors.blue
    ..style = PaintingStyle.fill;
  Path? path;

  final double chamferSize = 20.0;


  //String? text;


  @override
  Widget build(BuildContext context) {
    Size size = const Size(300, 100);
     path = Path()
      ..moveTo(chamferSize, 0) //
      ..lineTo(size.width - chamferSize, 0) //
      ..lineTo(size.width, chamferSize) //
      ..lineTo(size.width, size.height) //
      ..lineTo(0, size.height) //
      ..lineTo(0, chamferSize) //
      ..close(); //
    return Container(
         width: 500,
         height: 100,
         decoration: BoxDecoration(
           color: Colors.blue,
           borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12),
           bottomRight: Radius.circular(12)),
         ),
         child:  Text(
           text!,
           style: TextStyle(color: Colors.black),
         ),

    );
  }

   Future<BitmapDescriptor?> getMarkerIconFromCanvas(String text, bool flag) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = primaryColor;
    const int size = 400; //change this according to your app
    final rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, flag?250:150, 150),
      topLeft: const Radius.circular(50),
      topRight: const Radius.circular(50),
      bottomLeft:  Radius.zero,
      bottomRight: const Radius.circular(50),
    );
    // canvas.drawRRect(const Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawRRect(rrect, paint1);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      // text: text, //you can write your own text here or take from parameter
      text: !flag? String.fromCharCode(0xf0737):text,
      style:  TextStyle(
          fontSize: !flag?80:50, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: !flag?'MaterialIcons':null),
    );
    painter.layout();
    painter.paint(
      canvas,
      // Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      const Offset(30, 50),
    );

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    final imageData = data?.buffer.asUint8List();
    if (imageData != null) {
      return BitmapDescriptor.fromBytes(imageData);
    }
    return null;
  }

}