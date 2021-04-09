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
import 'package:kip/screens/subcategoryelect.dart';
import 'package:kip/screens/subcategoryinfo.dart';
import 'package:kip/screens/usersettings.dart';
import 'package:kip/screens/category.dart';
import 'package:kip/utils/constant.dart';
import 'package:kip/widgets/item_product.dart';
import 'package:kip/widgets/occasions.dart';
import 'package:kip/utils/navigator.dart';
import 'package:page_transition/page_transition.dart';
import 'checkout.dart';
import 'products_list.dart';
import 'usersettings.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
       length: 2,
       child: ListView(
         children: <Widget>[
           SizedBox(height: 30,),
           Container(
             alignment: Alignment.center,
             width: MediaQuery.of(context).size.width / 3,
             margin: const EdgeInsets.only(right: 5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5.0),
               color: Colors.orange,
             ),
             child:  ListTile(
               title: Text('Électronique'),
               trailing: Icon(Icons.keyboard_arrow_right),

                onTap: () => Navigator.of(context).push(
               MaterialPageRoute(builder:(_) =>Subcategoryelect())),
             ),
           ),
           SizedBox(height: 30,),
           Container(
             alignment: Alignment.center,
             width: MediaQuery.of(context).size.width / 3,
             margin: const EdgeInsets.only(right: 5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5.0),
               color: Colors.orange,
             ),
             child:  ListTile(
               title: Text('Informatique'),
               trailing: Icon(Icons.keyboard_arrow_right),
               onTap: () => Navigator.of(context).push(
                   MaterialPageRoute(builder: (_) =>Subcategoryinfo())),
             ),
           ),



         ],
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


  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }




  BottomNavyBar buildBottomNavyBar(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      onItemSelected: (index) =>
          setState(() {
            currentIndex = index;
          }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Accueil'),
          activeColor: Theme
              .of(context)
              .primaryColor,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Categories'),
            activeColor: Theme
                .of(context)
                .primaryColor),
        BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Panier'),
            activeColor: Theme
                .of(context)
                .primaryColor),
        BottomNavyBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Commandes'),
            activeColor: Theme
                .of(context)
                .primaryColor),
      ],
    );
  }

  // AppBar buildAppBar(BuildContext context) {
  //   return AppBar(
  //     title: Text(
  //       "Je fais du shopping pour...",
  //       style: TextStyle(color: Colors.black, fontSize: 16),
  //     ),
  //     leading: new IconButton(
  //         icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
  //             color: Colors.black),
  //         onPressed: () => _scaffoldKey.currentState.openDrawer()),
  //     actions: <Widget>[
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             PageTransition(
  //               type: PageTransitionType.fade,
  //               child: Search(),
  //             ),
  //           );
  //         },
  //         child: Icon(
  //           MaterialCommunityIcons.getIconData("magnify"),
  //           color: Colors.black,
  //         ),
  //       ),
  //       IconButton(
  //         icon: Icon(
  //           MaterialCommunityIcons.getIconData("cart-outline"),
  //         ),
  //         color: Colors.black,
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             PageTransition(
  //               type: PageTransitionType.fade,
  //               child: ShoppingCart(true),
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //     backgroundColor: Colors.white,
  //   );
  // }


}