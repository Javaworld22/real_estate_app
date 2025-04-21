import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class FloatingThemeBtnsWidget extends StatefulWidget {
  ValueChanged<bool>? update;
   FloatingThemeBtnsWidget({
    super.key, this.update,
  });

  @override
  State<FloatingThemeBtnsWidget> createState() => _FloatingThemeBtnsWidget();
}


  class _FloatingThemeBtnsWidget extends State<FloatingThemeBtnsWidget> {

  final _key = GlobalKey<ExpandableFabState>();
  bool area = false, price = false, layer = false;
  bool? flag;
  // Color textColor(MapStyles mapStyle) {
  //   return switch (mapStyle) {
  //     MapStyles.nightBlue => Colors.blue,
  //     MapStyles.retro => Colors.amber,
  //     MapStyles.night => Colors.blueGrey,
  //     _ => Colors.black,
  //   };
  // }

  // IconData styleIcons(MapStyles mapStyle) {
  //   return switch (mapStyle) {
  //     MapStyles.nightBlue => Icons.nightlight_outlined,
  //     MapStyles.night => Icons.dark_mode,
  //     MapStyles.retro => Icons.filter_vintage,
  //     MapStyles.dark => Icons.nights_stay_rounded,
  //     MapStyles.original => Icons.wb_sunny_outlined,
  //   // _ => Icons.sunny,
  //   };
  // }

  @override
  void initState() {
    update = widget.update;
    super.initState();
  }

  ValueChanged<bool>? update;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 130,
          top: 10,
          left: 7,
          right: 10,
          child: ZoomIn(
            duration: const Duration(milliseconds: 2000),
            child: ExpandableFab(
            key: _key,
            type: ExpandableFabType.up,
            pos: ExpandableFabPos.left ,
            fanAngle: 180,
            distance: 70,
            overlayStyle: ExpandableFabOverlayStyle(
              blur: 0,
              color: Colors.black.withAlpha(20),
            ),
            openButtonBuilder: FloatingActionButtonBuilder(
              size: 80,
              builder: (context, controller, _) {
                return  SizedBox.square(
                  dimension: 60,
                  child: Card(
                    color: whileColor40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    elevation: 5,
                    child:  Icon(Icons.near_me_outlined, color: Colors.white54,),

                  ),
                );
              },
            ),
            closeButtonBuilder: FloatingActionButtonBuilder(
              size: 80,
              builder: (context, controller, _) {
                return const SizedBox.square(
                  dimension: 60,
                  child: Card(
                    color: whileColor80,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    elevation: 5,
                    child: Icon(Icons.close),
                  ),
                );
              },
            ),
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          area = true;
                          price = false;
                          layer = false;
                          update!(layer);
                        });
                      },
                  child: ListTile(
                    leading:  SizedBox(
                      height: 25,
                      width: 25,
                      child: Icon(Icons.price_change_rounded, color: area?primaryColor:null,),
                    ),
                    title: Text(
                      'Cosy Area',
                      style:  TextStyle(
                        color: area?primaryColor:null,
                        fontSize: 16,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w500,
                        //letterSpacing: -0.20,
                      ),
                    ),
                  ),
    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          area = false;
                          price = true;
                          layer = false;
                          update!(price);
                        });
                      },
                    child: ListTile(
                      leading:  SizedBox(
                        height: 25,
                        width: 25,
                        child: Icon(Icons.timer, color: price?primaryColor:null,),
                      ),
                      title: Text(
                        'Price',
                        style:  TextStyle(
                          color: price?primaryColor:null,
                          fontSize: 16,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          //letterSpacing: -0.20,
                        ),
                      ),
                    ),
    ),
                    GestureDetector(
                      onTap: (){
                        debugPrint('Volt here');
                        setState(() {
                          area = false;
                          price = false;
                          layer = true;
                          update!(layer);
                        });
                      },
                    child: ListTile(
                      leading:  SizedBox(
                        height: 25,
                        width: 25,
                        child: Icon(Icons.view_comfortable_rounded, color: layer?primaryColor:null,),
                      ),
                      title: Text(
                        'Without Only Layer',
                        style:  TextStyle(
                           color: layer? primaryColor : null,
                          fontSize: 16,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          //letterSpacing: -0.20,
                        ),
                      ),
                    ),
    ),
                  ],
                ),
              ),

            ],
          ),
    ),
        ),
        Positioned(
           bottom: 130,
           top: 10,
           left: 7,
          right: 10,
          child: ZoomIn(
            duration: const Duration(milliseconds: 2000),
            child: ExpandableFab(
      //key: _key,
      type: ExpandableFabType.up,
      pos: ExpandableFabPos.right ,
      fanAngle: 180,
      distance: 70,
      overlayStyle: ExpandableFabOverlayStyle(
        blur: 0,
        color: Colors.black.withAlpha(20),
      ),
      openButtonBuilder: FloatingActionButtonBuilder(
        size: 80,
        builder: (context, controller, _) {
          return  SizedBox.fromSize(
            size: const Size(190, 50),
            //dimension: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: whileColor80,
              ),
            child: const ListTile(
              leading:  Padding(
                padding: EdgeInsets.all(0),
              child: SizedBox(
                height: 25,
                width: 25,
                child: Icon(Icons.view_comfortable_rounded,),
              ),
            ),
              title: Text(
                'List of Variants',
                style:  TextStyle(
                  //color: layer? primaryColor : null,
                  fontSize: 12,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w500,
                  //letterSpacing: -0.20,
                ),
              ),
            ),
          ),
          );
        },
      ),
            closeButtonBuilder: FloatingActionButtonBuilder(
              size: 80,
              builder: (context, controller, _) {
                return  SizedBox.fromSize(
                  size: const Size(190, 50),
                  //dimension: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: whileColor80,
                    ),
                    child: ListTile(
                      leading:  Padding(
                        padding: const EdgeInsets.all(0),
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Icon(Icons.close,),
                        ),
                      ),
                      title: Text(
                        'Close of tab',
                        style:  TextStyle(
                          //color: layer? primaryColor : null,
                          fontSize: 12,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500,
                          //letterSpacing: -0.20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      children: [

      ],
    ),
    ),
    ),
    ],
    );
  }
}