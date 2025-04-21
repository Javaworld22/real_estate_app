import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_app/ui/home/views/components/products.dart';

import '../../../components/countdown_animation.dart';
import '../../../constants.dart';
import '../../../preference/sharedpreference_repository.dart';
import '../../../route/route_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with  TickerProviderStateMixin{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SharedPreferenceRepository? preps;
  bool search = false;
  bool msg = false;
  bool home = true;
  bool love = false;
  bool person = false;
  //AnimationController? firstController;
  bool mContainer = true, mHeading = false, mBottom = true, mProduct = false;
  int _counter = 0, _mCounter = 0;
  Timer? _timer;
  final Random _random = Random();
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  void startCounter() {
    // Set the counter to a random value between 0 and 999 (you can change it to whatever value you prefer)
    _counter = _random.nextInt(1000);
    _mCounter = _random.nextInt(2000);
    int x = 1056 - _counter, y = 2100 - _mCounter;
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        _counter++;
        _mCounter++;
      });
      if(_counter  == 1056 || _mCounter == 2100){
        firstController.forward();
        stopCounter();
      }
    });
  }

  void stopCounter() {
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
      // Stops the counter and prints the value when pressing a key
      print('Stopped at: $_counter');
    }
  }


  @override
  void initState() {
    // bottomSheetcontroller = BottomSheet.createAnimationController(this);
    // bottomSheetcontroller.duration = const Duration(milliseconds: 5000);
    // firstController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 1000));

    firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    firstAnimation = Tween<double>(begin: 1, end: 20.1).animate(
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

    Timer(const Duration(milliseconds: 500), () async{
      setState(() {
        mContainer = false;
      });
preps = await SharedPreferenceRepository.instance;
await preps?.setSlide(false);
    });
    startCounter();
    super.initState();
  }

  @override
  void dispose() {
    firstController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Transparent status bar
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark, // Dark text for status bar
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Stack(
          children: [
        Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFDF8F3),
                Color(0xFFFFBD70),
              ],
            ),
          ),
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                width: mContainer?0:150,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                duration: const Duration(seconds: 2),
                onEnd: (){
                  //debugPrint('Ended here');
                  setState(() {
                    mHeading = true;
                  });
                  //bottomSheet(context,);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: mHeading,
                      child:   AnimatedOpacity(opacity: mHeading?1:0.1, duration: const Duration(seconds: 6),
                     child:  FadeIn(
                       duration: const Duration(milliseconds: 1500),
                       child: const Text('Saint Peterburg', textAlign: TextAlign.center,),
                ),
          ),
          ),
          ],
      ),
              ),
              ZoomIn(
                duration: const Duration(milliseconds: 4000),
                child: Padding(
                padding: const EdgeInsets.all(18) ,
                child: AnimatedContainer(
                  width: 50,
                  height: 50,
                  duration: Duration(seconds: 2),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/login_dark.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
      ),
            ],
          ),
        ),

          FadeIn(
            duration: const Duration(milliseconds: 1300),
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16) ,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Text('Hi, Marina', textAlign: TextAlign.left,),
      ],
    ),
    ),
    ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16) ,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInUp(child: SizedBox(
                width: 300,
                child: const Text('Lets select your perfect place', textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w500,
                    //letterSpacing: -0.20,
                  ),
                ),
              ),
                duration: const Duration(milliseconds: 2000),
                onFinish: (direction){
                 setState(() {
                   mBottom = false;
                 });
                },
              ),

      ],
    ),
    ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding) ,
         child:  Row(
           mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 2000),
                child: Container(
            width: 180,
            height: 180,
            padding: EdgeInsets.only(top: 15, ),
            decoration: BoxDecoration(
color: primaryColor,
    borderRadius: BorderRadius.circular(90),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
             // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Text('Buy'),
                const SizedBox(height: 25,),
                Text('$_counter',
                style: const TextStyle(
                  //color: Colors.red,
                  fontSize: 28,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w500,
                  //letterSpacing: -0.20,
                ),),

                Text('offers'),
            ],
      ),
          ),
        ),
          ZoomIn(
            duration: const Duration(milliseconds: 2000),
              child: Container(
                width: 180,
                height: 180,
                padding: EdgeInsets.only(top: 15,),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultBorderRadious),
                ),
                child: Column(
                  children: [
                    Text('RENT'),
                    SizedBox(height: 25,),
                    Text('$_mCounter',  style: const TextStyle(
                      //color: Colors.red,
                      fontSize: 28,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w500,
                      //letterSpacing: -0.20,
                    ),),
                    Text('offers'),
                  ],
                ),
              ),
          ),
      ],
    ),
    ),
         // SizedBox(height: 20,),
    //        Visibility(
    //          visible: mHeading,
    //          child: SlideInUp(
    //          duration: const Duration(milliseconds: 2000),
    //          curve: Curves.fastOutSlowIn,
    //          child: Products(),
    // ),
    // ),
        ],
      ),
    ),
          ],
      ),
    ),
            ),
      bottomNavigationBar: Stack(
        children: [
      AnimatedContainer(
        height: mBottom?0: 650,
          duration: const Duration(milliseconds: 4000) ,
          curve: Curves.fastEaseInToSlowEaseOut,
      onEnd: (){
        debugPrint('Animation stopped 111');
preps?.setSlide(true);
        firstAnimation = Tween<double>(begin: 1, end: 20.1).animate(
            CurvedAnimation(parent: firstController, curve: Curves.fastEaseInToSlowEaseOut, /**reverseCurve: Curves.fastOutSlowIn**/ ));
    Timer(const Duration(milliseconds: 500), () async{

    firstController.forward();
    });
      },
      child: SingleChildScrollView(
      child: Products(product: mProduct,),
    ),
    ),
         Positioned(
            left: 30,
            right: 30,
            bottom: ((firstAnimation.value * 6)-90),
            child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF161616),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          search = true;
                          msg = false;
                          home = false;
                          love = false;
                          person = false;
                        });
                        Navigator.pushNamed(context, realEstateMap);

                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color:search?primaryColor:Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5) ,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              // Image.asset(
                              //   'assets/images/ic_home.svg',
                              //   width: 25,
                              //   height: 25,
                              //   fit: BoxFit.cover,
                              //   color: primaryColor ,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          search = false;
                          msg = true;
                          home = false;
                          love = false;
                          person = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: msg?primaryColor:Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5) ,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                "assets/icons/message.svg",
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              // Image.asset(
                              //   'assets/images/ic_home.svg',
                              //   width: 25,
                              //   height: 25,
                              //   fit: BoxFit.cover,
                              //   color: primaryColor ,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          search = false;
                          msg = false;
                          home = true;
                          love = false;
                          person = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: home?primaryColor:Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7) ,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                "assets/icons/ic_home.svg",
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              // Image.asset(
                              //   'assets/images/ic_home.svg',
                              //   width: 25,
                              //   height: 25,
                              //   fit: BoxFit.cover,
                              //   color: primaryColor ,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          search = false;
                          msg = false;
                          home = false;
                          love = true;
                          person = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: love?primaryColor:Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9) ,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                "assets/icons/ic_love.svg",
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              // Image.asset(
                              //   'assets/images/ic_home.svg',
                              //   width: 25,
                              //   height: 25,
                              //   fit: BoxFit.cover,
                              //   color: primaryColor ,
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          search = false;
                          msg = false;
                          home = false;
                          love = false;
                          person = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: person?primaryColor:Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5) ,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                "assets/icons/ic_person.svg",
                                width: 16,
                                height: 16,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              // Image.asset(
                              //   'assets/images/ic_home.svg',
                              //   width: 25,
                              //   height: 25,
                              //   fit: BoxFit.cover,
                              //   color: primaryColor ,
                              // ),
                            ),
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
      ],
    ),
    );
  }

}
