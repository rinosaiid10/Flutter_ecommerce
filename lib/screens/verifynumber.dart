import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kip/screens/verificationcode.dart';
import 'package:kip/utils/countrydropdown.dart';
import 'package:kip/widgets/socialbottomsheet.dart';

import 'login.dart';

class VerifyScreeen extends StatefulWidget {
  @override
  _VerifyScreeenState createState() => _VerifyScreeenState();
}

class _VerifyScreeenState extends State<VerifyScreeen> {
  var _txtNumber = TextEditingController();
  String _txtNumberHint = "05078596252";

  @override
  void initState() {
    _txtNumber.addListener(() {
      setState(() {
        _txtNumberHint = _txtNumber.text;
        print("Valeur du numéro de texte: ${_txtNumber.text}");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(

        centerTitle:true,
        title: Text("",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        automaticallyImplyLeading: false,

        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen ()),
              );
            }
            ,
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 96.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("Vérifiez votre numéro de téléphone",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.title),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 36.0),
                  child: Text(
                      "Nous vous avons envoyé un SMS avec un code à numéro +90$_txtNumberHint",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 8.0, left: 24.0, right: 24.0),
                      child: TextField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).dividerColor,
                          hintStyle: Theme.of(context).textTheme.subtitle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 36.0, bottom: 8.0, left: 36.0, right: 24.0),
                      child: CountryPickerDropdown(
                        initialValue: 'tr',
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Country country) {
                          print("${country.name}");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 8.0, left: 184.0, right: 24.0),
                      child: TextField(
                        controller: _txtNumber,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.timesCircle,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _txtNumber.text = "";
                              });
                              print("icône de numéro de texte clair enfoncée.");
                            },
                          ),
                          hintText: "I  Numero",
                          hintStyle: Theme.of(context).textTheme.display2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Or login with   ",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      GestureDetector(
                        onTap: () {
                          socialBottomSheet(context);
                          print("Social Network pressed");
                        },
                        child: Text(
                          "Social Network",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            color: Color(0xFFF93963),
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerificationScreen()),
                              ),
                            },
                            child: new Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: Text(
                                      "Next",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

void socialBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SocialBottomSheet();
      });
}
