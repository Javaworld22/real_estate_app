import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Countdown extends AnimatedWidget {
  final Animation<int>? animation;
  Color? color =  Colors.white;

  Countdown({
    Key? key,
    this.color,
    this.animation,
  }) : super(key: key, listenable: animation!);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);

    String timerText =
        clockTimer.inMilliseconds.remainder(2000).toString().padLeft(2, '0');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Text(
        //   "Timer",
        //   style: TextStyle(fontSize: 15, color: AppColors.background,
        //   fontWeight: FontWeight.w300,),
        // ),
        Text(
          timerText,
          style: TextStyle(fontSize: 15,
            color: color,//AppColors.background,
            fontWeight: FontWeight.w300,),
        ),
      ],
    );
  }
}