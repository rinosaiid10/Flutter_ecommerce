import 'package:flutter/material.dart';
import 'package:kip/utils/codeinput.dart';
import 'home.dart';
import 'package:kip/utils/progressdialog.dart';

import 'login.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, ProgressDialogType.Normal);
    pr.setMessage('Vérification du compte...');
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
                  child: Text("Vérification du téléphone",
                      style: Theme.of(context).textTheme.title),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 48.0),
                  child: Text(
                    "Entrez votre code ici",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 64.0),
                  child: CodeInput(
                    length: 4,
                    keyboardType: TextInputType.number,
                    builder: CodeInputBuilders.darkCircle(),
                    onFilled: (value) async {
                      print('Votre contribution est $value.');
                      pr.show();
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        setState(() {
                          pr.hide();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        });
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "N'avez-vous pas reçu de code?",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    ),
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Renvoyer le nouveau code",
                      style: TextStyle(
                        fontSize: 19,
                        color: Theme.of(context).primaryColor,
                      ),
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
