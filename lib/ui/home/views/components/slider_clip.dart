import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

import '../../../../preference/sharedpreference_repository.dart';

class SliderClip extends  StatefulWidget  {
  bool? flag, mProduct;
  String? name;

  SliderClip({super.key, this.flag, this.mProduct, this.name});

  @override
  State<SliderClip> createState() => _SliderClip();
}




class _SliderClip extends State<SliderClip> with TickerProviderStateMixin{
  bool? flag;
  late AnimationController firstController;
  late Animation<double> firstAnimation;
  bool mSlider = false, checkers = false, flagText = false;
  bool? mProduct;
  SharedPreferenceRepository? preps;
  String? name;



  @override
  void initState() {
    flag = widget.flag!;
    name = widget.name!;
    mProduct = widget.mProduct!;
    firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3500));
    firstAnimation = Tween<double>(begin: 1, end: 10.1).animate(
        CurvedAnimation(parent: firstController, curve: Curves.fastEaseInToSlowEaseOut, /**reverseCurve: Curves.fastOutSlowIn**/ ))  //fastOutSlowIn
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
//debugPrint('Animation stopped');
          //firstController.reverse();

        } else if (status == AnimationStatus.dismissed) {
          //firstController.forward();
        }
      });
    Timer(const Duration(seconds: 1), () async{
      preps = await SharedPreferenceRepository.instance;
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    mProduct =  preps?.isSliding()??false;
    //debugPrint('Slider result $mProduct');
    if(mProduct! && !checkers) {
      Timer(const Duration(milliseconds: 500), () async{
        setState(() {
          mSlider = true;
          checkers = true;
        });
        firstAnimation = Tween<double>(begin: 1, end: 10.1).animate(
            CurvedAnimation(parent: firstController, curve: Curves.fastEaseInToSlowEaseOut, /**reverseCurve: Curves.fastOutSlowIn**/ ))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                flagText = true;
              });
            } else if (status == AnimationStatus.dismissed) {
              //firstController.forward();
            }
          });//fastOutSlowIn

        firstController.forward();
      });
      //debugPrint('Slider result ${firstAnimation.value}');
    }
    //debugPrint('Slider result $firstAnimation.value');
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Visibility(
          visible: mSlider,
          child: Container(
           //duration: const Duration(milliseconds: 300),
          width: (!mSlider)?0:(flag! && mSlider)? (42+(firstAnimation.value * 12)*2): (20+(firstAnimation.value * 6.1)*2),  //300,200
          height: flag! ?50:30,
          decoration: BoxDecoration(
            color: const Color(0xFFF4E3CF).withOpacity(0.7),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: flagText,
                child: FadeIn(
                  duration: const Duration(milliseconds: 1300),
                  child: GradientAnimationText(
                  text: Text('$name'),
                    colors: const [
                      Color(0xff8f00ff),  // violet
                      Colors.indigo,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.orange,
                      Colors.red,
                    ],
                    duration: const Duration(seconds: 3),
                  ),
          ),
          ),
      ],
    ),
        ),
    ),
        Visibility(
          visible: mSlider,
          child: Transform.translate(
    offset: Offset(flag!?(firstAnimation.value * 12)*2:(firstAnimation.value * 5.5)*2,0),
         // duration: const Duration(milliseconds: 5000),
         // left: (!mSlider)?0:(flag! || mSlider) ? 200 : 60,
          child: Container(
           // duration: const Duration(milliseconds: 5000),
            height: flag! ? 50 : 30,
            width: flag!? 50 : 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              color: Colors.white,
            ),
            child: SizedBox(
              width: 25,
              height: 25,
              child: IconButton(
                iconSize: 25,
                onPressed: () async {},
                color: Colors.grey,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
            ),
          ),
        ),
    ),
      ],
    );
  }
}
