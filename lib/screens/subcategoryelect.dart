import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kip/models/product.dart';
import 'package:kip/painters/circlepainters.dart';
import 'package:kip/screens/products_list.dart';
import 'package:kip/screens/search.dart';
import 'package:kip/screens/shoppingcart.dart';
import 'package:kip/screens/usersettings.dart';
import 'package:kip/screens/category.dart';
import 'package:kip/utils/constant.dart';
import 'package:kip/widgets/item_product.dart';
import 'package:kip/widgets/occasions.dart';
import 'package:kip/utils/navigator.dart';
import 'package:page_transition/page_transition.dart';

import 'checkout.dart';
import 'home.dart';
import 'products_list.dart';
import 'usersettings.dart';

class Subcategoryelect extends StatefulWidget {
  @override
  _SubcategoryelectState createState() => _SubcategoryelectState();
}

class _SubcategoryelectState extends State<Subcategoryelect> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,

        body: TabBarView(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "TELEVISIONS",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: ProductList(),
                                  ),
                                );
                              },
                              child: Text(
                                "VOIR TOUS",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "APPAREIL PHOTO ET CAMERAS",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: ProductList(),
                                  ),
                                );
                              },
                              child: Text(
                                "VOIR TOUS",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "AUDIO & HIFI",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: ProductList(),
                                  ),
                                );
                              },
                              child: Text(
                                "VOIR TOUS",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.blue),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTrending(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTrending() {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 11 (128GB)',
                    icon: 'assets/phone1.jpeg',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$4,000'),
                gradientColors: [Color(0XFFa466ec), Colors.purple[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'iPhone',
                    name: 'iPhone 11 (64GB)',
                    icon: 'assets/phone2.jpeg',
                    rating: 4.5,
                    price: '\$3,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
              TrendingItem(
                product: Product(
                    company: 'Xiaomi',
                    name: 'Xiaomi Redmi Note8',
                    icon: 'assets/mi1.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
            ],
          ),
        )
      ],
    );
  }




}