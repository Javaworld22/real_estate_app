import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/constants.dart';
import 'package:real_estate_app/ui/home/views/components/slider_clip.dart';

class Products extends StatefulWidget {
  bool? product;

  Products({
    super.key, this.product
  });
  @override
  State<Products> createState() => _Products();
}

class _Products extends State<Products>{
bool? product;
  @override
  void initState() {
    product = widget.product;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //debugPrint('Product is $product');
    return Container(
      //height: 200,
      width: size.width,
      decoration:  const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultBorderRadious) , topRight:  Radius.circular(defaultBorderRadious)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultBorderRadious) , topRight:  Radius.circular(defaultBorderRadious)),
            ),
            child: Padding(
              padding:  const EdgeInsets.only(top: defaultBorderRadious, left: defaultBorderRadious, right: defaultBorderRadious) ,
              child: Stack(
                children: [
              SizedBox(
                width: size.width,
                height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                  child: Image.asset(
                    'assets/images/real_estate.jpg',
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
    ),
              ),

                      Positioned(
                        right: 35,
                        left: 35,
                        bottom: 20,
                        child:  SliderClip(flag: true, mProduct: product, name: 'Ikeja St, 67',),
          ),
    ],
                  ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultBorderRadious) , topRight:  Radius.circular(defaultBorderRadious)),
                ),
                child: Padding(
                  padding:  const EdgeInsets.only(top: defaultBorderRadious, left: defaultBorderRadious, ) ,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: (size.width-37)/2,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                          child: Image.asset(
                            'assets/images/real_estate.jpg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        right: 20,
                        left: 20,
                        bottom: 20,
                        child:  SliderClip(flag: false,mProduct: product, name: 'Gladkova St, 25',),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(width: 12,),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultBorderRadious) , topRight:  Radius.circular(defaultBorderRadious)),
                ),
                child: Padding(
                  padding:  const EdgeInsets.only(top: defaultBorderRadious, right: defaultBorderRadious) ,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: (size.width-37)/2,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                          child: Image.asset(
                            'assets/images/lotus_design.jpg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        right: 20,
                        left: 20,
                        bottom: 20,
                        child:  SliderClip(flag: false, mProduct: product, name: 'Trevoleva St, 43',),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultBorderRadious) , topRight:  Radius.circular(defaultBorderRadious)),
                ),
                child: Padding(
                  padding:  const EdgeInsets.only(top: defaultBorderRadious, left: defaultBorderRadious, ) ,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: (size.width-37)/2,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                          child: Image.asset(
                            'assets/images/real_estate.jpg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        right: 20,
                        left: 20,
                        bottom: 20,
                        child:  SliderClip(flag: false, mProduct: product, name: 'Gubina St, 11',),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(width: 12,),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultBorderRadious) , topRight:  Radius.circular(defaultBorderRadious)),
                ),
                child: Padding(
                  padding:  const EdgeInsets.only(top: defaultBorderRadious, right: defaultBorderRadious) ,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: (size.width-37)/2,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultBorderRadious),
                          child: Image.asset(
                            'assets/images/lotus_design.jpg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        right: 20,
                        left: 20,
                        bottom: 20,
                        child:  SliderClip(flag: false, mProduct: product,name: 'Sedova St, 22',),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}