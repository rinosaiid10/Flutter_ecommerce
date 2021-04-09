import 'package:flutter/material.dart';
import 'package:kip/screens/register.dart';
import 'package:kip/screens/size_config.dart';
import 'package:kip/screens/socal_card.dart';
import 'package:kip/screens/verifynumber.dart';
import 'package:kip/utils/progressdialog.dart';
import 'package:kip/widgets/edittext.dart';
import 'package:kip/widgets/submitbutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {


    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('chargement...');
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // centerTitle:true,
        // title: Text("",textAlign: TextAlign.center,textScaleFactor: 1.2,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions: [

          Image.asset("assets/images/Logo.png",height: 50,),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[

                Text("Bienvenue", style: Theme.of(context).textTheme.title),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Connectez-vous à votre compte",
                      style: Theme.of(context).textTheme.subtitle),
                ),
                EditText(title: "Email"),
                EditText(title: "Password"),
                SubmitButton(
                  title: "SE CONNECTER",
                  act: () async {
                    progressDialog.show();
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      setState(() {
                        progressDialog.hide();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyScreeen(),
                          ),
                        );
                      });
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text("Mot de passe oublié?"),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Vous n'avez pas de compte?  ",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                      ),


                    ),
                  ],
                ),
                SizedBox(height: 10
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    // SocalCard(
                    //   icon: "assets/icons/twitter.svg",
                    //   press: () {},
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
