import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/ui/map/views/components/text_on_widget.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../../components/floating_themes_btn.dart';
import '../../../components/textfield_them.dart';
import '../../../constants.dart';
import '../../../route/route_constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreen();
}


class _MapScreen extends State<MapScreen> with TickerProviderStateMixin{
  final Completer<dynamic> controller = Completer();
  final LatLng myCurrentLocation = const LatLng(6.5019779, 3.3398031);
  String? _mapStyleString;
  Set<Marker> markers = {};
  Set<Marker> mMarkers = {};
  double _southWestLat = 0.0;
  double _southWestLong = 0.0;
  double _northEastLat = 0.0;
  double _northEastLong = 0.0;
  bool search = true;
  bool msg = false;
  bool home = false;
  bool love = false;
  bool person = false;
  bool mAdjust = true;
  Timer? _timer;


  @override
  void initState() {
    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyleString = string;
    });
    initMarkers();
    super.initState();
  }

  // startUpdate(){
  //   _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) async{
  //     await initMarkers();
  //
  //   });
  // }

  initMarkers() async {
    markers = {};

    markers.add(Marker(
      markerId: const MarkerId("1"),
      position: myCurrentLocation,
      icon: await  TextOnWidget(text: '',).getMarkerIconFromCanvas('93.3mp', mAdjust)??
        await TextOnWidget(text: '56').toBitmapDescriptor(
            logicalSize: const Size(100, 100), imageSize: const Size(300, 300)),
    ));

    markers.add(Marker(
      markerId: const MarkerId("2"),
      position: const LatLng(6.5162, 3.3740),
      icon: await TextOnWidget(text: '',).getMarkerIconFromCanvas('67.3mp', mAdjust)??
          await TextOnWidget(text: '56').toBitmapDescriptor(
              logicalSize: const Size(100, 100), imageSize: const Size(300, 300)),
    ));

    markers.add(Marker(
      markerId: const MarkerId("3"),
      position: const LatLng(6.5796, 3.3226),
      icon: await  TextOnWidget(text: '',).getMarkerIconFromCanvas('13.3mp', mAdjust)??
          await TextOnWidget(text: '56').toBitmapDescriptor(
              logicalSize: const Size(100, 100), imageSize: const Size(300, 300)),
    ));

     markers.add(Marker(
     markerId: const MarkerId("4"),
     position: const LatLng(6.4703, 3.2818),
     icon: await TextOnWidget(text: '',).getMarkerIconFromCanvas('7.3mp',mAdjust)??
     await TextOnWidget(text: '56').toBitmapDescriptor(
     logicalSize: const Size(100, 100), imageSize: const Size(300, 300)),
     ));
// Ikeja gra
    markers.add(Marker(
      markerId: const MarkerId("4"),
      position: const LatLng(6.5790, 3.3495),
      icon: await TextOnWidget(text: '',).getMarkerIconFromCanvas('7.3mp',mAdjust)??
          await TextOnWidget(text: '56').toBitmapDescriptor(
              logicalSize: const Size(100, 100), imageSize: const Size(300, 300)),
    ));

     setState(() {
       mMarkers = markers;
     });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton:  FloatingThemeBtnsWidget(update: (value) async{
        debugPrint('Check here $value');
        setState(() {
          mAdjust = !mAdjust;
        });
        await setBounds(const LatLng(6.5796, 3.3226), const LatLng(6.5162, 3.3740));
      },),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Transparent status bar
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light, // Dark text for status bar
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              trafficEnabled: true,
              zoomGesturesEnabled: true,
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              onMapCreated: (mapController) async{
                controller.complete(mapController);
                //await setBounds(const LatLng(6.4703, 3.2818), const LatLng(6.5162, 3.3740));
                  controller.future.then((value) {
                    value.setMapStyle(_mapStyleString);
                  });
                await setBounds(const LatLng(6.5796, 3.3226), const LatLng(6.5162, 3.3740));
              },
              // onCameraMove: (position) async{
              //   print('Camera moved');
              //   await setBounds(const LatLng(6.5796, 3.3226), const LatLng(6.5162, 3.3740));
              // },
              onCameraMoveStarted: () async{

              },
              initialCameraPosition: CameraPosition(
                target: myCurrentLocation,
                zoom: 12,
                tilt: 2,
              ),
              //polylines:  Set<Polyline>.of(controller.polylines.values),
              markers: mMarkers,
            ),
          ),
          Positioned(
            top: 60,
          left: 30,
          right: 30,
          child: TextFieldThem.buildTextFiledWithPrefixIcon(
            context,
            hintText: 'Saint Pertersburg',
            controller: TextEditingController(),
            prefix: SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                alignment: Alignment.center,
               // iconSize: 25,
                onPressed: () async {},
                color: const Color(0xff0a0a0a),
                icon: const Icon(
                  Icons.search,
                //  size: 25,
                ),
              ),
            ),
          )
    ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 30,
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
                          Navigator.pushNamed(context, homePage);
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


  Future<void> setBounds(LatLng firstCoordinates, LatLng secondCoordinates) async{
    if (firstCoordinates.latitude <= secondCoordinates.latitude) {
      _southWestLat = firstCoordinates.latitude;
      _northEastLat = secondCoordinates.latitude;
    } else {
      _northEastLat = firstCoordinates.latitude;
      _southWestLat = secondCoordinates.latitude;
    }

    if (firstCoordinates.longitude <= secondCoordinates.longitude) {
      _southWestLong = firstCoordinates.longitude;
      _northEastLong = secondCoordinates.longitude;
    } else {
      _northEastLong = firstCoordinates.longitude;
      _southWestLong = secondCoordinates.longitude;
    }
    await initMarkers();
    GoogleMapController mController = await controller.future;
    mController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(
            _northEastLat,
            _northEastLong,
          ),
          southwest: LatLng(
            _southWestLat,
            _southWestLong,
          ),
        ),
        60.0,
      ),
    );
  }

}
