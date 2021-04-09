import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/ionicons.dart';
import 'package:kip/utils/navigator.dart';

import 'home.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EKIP Service",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon:
          Icon(Ionicons.getIconData("ios-arrow-back"), color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body:  ListView(
        children: <Widget>[
          SizedBox(height: 30,),

          GestureDetector(
            onTap: () {},
            child: Container(
              child: ListTile(
                subtitle: Text(
                  "NOS SERVICES",

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
                        child: ListTile(
                          leading: Icon(Icons.fastfood_sharp),
                          title: Text('Ekip Food'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: ListTile(
                          leading: Icon(Icons.store),
                          title: Text('Devenez Vendeur'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: ListTile(
                          leading: Icon(Icons.storefront),
                          title: Text('Contactez-nous'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Commandez par téléphone'),
                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ],
          ),


        ],
      ),

    );
  }

}