import 'package:flutter/material.dart';
import 'package:kip/screens/login.dart';
import 'package:kip/screens/verifynumber.dart';
import 'package:kip/widgets/edittext.dart';
import 'package:kip/widgets/submitbutton.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,

          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Bienvenue",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    "Créer un compte",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                EditText(title: "Nom *"),
                EditText(title: "Prenom *"),
                EditText(title: "Numero *"),
                EditText(title: "E-mail *"),
                EditText(title: "Mot de Passe *"),
                EditText(title: "Confirmer Mot de Passe*"),

                SubmitButton(
                  title: "S'inscrire",
                  act: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyScreeen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Existe-t-il déjà un compte? ",
                        style: TextStyle(fontSize: 17),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "S'identifier",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17),
                        ),
                      ),
                    ],
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
