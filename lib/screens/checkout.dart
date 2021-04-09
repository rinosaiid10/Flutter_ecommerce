import 'dart:developer';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/ionicons.dart';
import 'package:kip/utils/navigator.dart';
import 'package:kip/widgets/submitbutton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:kip/screens/service.dart';


import 'home.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon:
              Icon(Ionicons.getIconData("ios-arrow-back"), color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body:  Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              // boutton chat en ligne
              SubmitButton(

                title: "Démarrer le chat en direct",
                act: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => VerifyScreeen(),
                  //   ),
                  // );
                },
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: ListTile(
                    subtitle: Text(
                      "A PROPOS DE EKIP",

                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 18),),

                  ),
                ),
              ),
              Column(
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: Service(),
                                ),
                              );
                            },
                            child: Container(

                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    "Ekip Service",

                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7), fontSize: 18),),
                                ),

                                elevation: 1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    "Faq",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7), fontSize: 18),
                                  ),
                                ),
                                elevation: 1,
                              ),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: ListTile(
                    subtitle: Text(
                      "PARAMETRES",

                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 18),),

                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Card(
                    child: Column(
                       children:  <Widget>[
                          GestureDetector(
                   onTap: () {},
                   child: Container(
                     child: Card(
                       child: ListTile(
                         title: Text(
                           "Notifications",
                           style: TextStyle(
                               color: Colors.black.withOpacity(0.7), fontSize: 18),
                         ),
                       ),
                       elevation: 1,
                     ),
                   ),
                 ),
                          Column(
                     children: <Widget>[
                       GestureDetector(
                         onTap: () {},
                         child: Container(
                           child: Card(
                             child: ListTile(
                               title: Text(
                                 "Pays",
                                 style: TextStyle(
                                     color: Colors.black.withOpacity(0.7), fontSize: 18),
                               ),
                             ),
                             elevation: 1,

                           ),
                         ),
                       ),
                       Card(
                         child: Column(
                           children: <Widget>[

                             CountryPickerDropdown(
                               initialValue: 'tr',
                               itemBuilder: _buildDropdownItem,
                               onValuePicked: (Country country) {
                                 print("${country.name}");
                               },
                             ),],

                         ),
                       ),

                     ],
                   ),
                   ],
                 ),


                  ),
                ],
              ),


              GestureDetector(
                onTap: () {
                  Text("fr");
                },
                child: Container(
                  child: ListTile(
                    subtitle: Text(
                      "Langue",

                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 18),),
                    trailing: Icon(Icons.keyboard_arrow_right),

                  ),
                ),
              ),
            ],
          )),

    );
  }

}

Widget _buildDropdownItem(Country country) => Row(
  children: <Widget>[
    CountryPickerUtils.getDefaultFlagImage(country),
    SizedBox(
      width: 8.0,
    ),
    Text(
      "+${country.phoneCode}(${country.isoCode})",
      style: TextStyle(fontSize: 14),
    ),
  ],
);
