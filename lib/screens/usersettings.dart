import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kip/screens/accountsettings.dart';
import 'package:kip/screens/checkout.dart';
import 'package:kip/screens/login.dart';
import 'package:page_transition/page_transition.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: UserSettingsState()));
  }
}

class UserSettingsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double verticalMargin = 0;
    return SingleChildScrollView(
      child: Division(
        style: StyleClass()
          ..margin(vertical: verticalMargin, horizontal: 20)
          ..minHeight(
              MediaQuery.of(context).size.height - (2 * verticalMargin)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Settings(),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionsRow extends StatelessWidget {
  Widget _buildActionsItem(String title, IconData icon) {
    return Division(
      style: actionsItemStyle,
      child: Column(
        children: <Widget>[
          Division(
            style: actionsItemIconStyle,
            child: Icon(
              icon,
              size: 20,
              color: Color(0xFF42526F),
            ),
          ),
          Text(
            title,
            style: actionsItemTextStyle,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildActionsItem('Waiting', Feather.getIconData("clock")),
        _buildActionsItem('Processing', Feather.getIconData("activity")),
        _buildActionsItem('Submitted', Feather.getIconData("check-circle")),
        _buildActionsItem('Pre-order', Feather.getIconData("repeat")),
      ],
    );
  }

  final StyleClass actionsItemIconStyle = StyleClass()
    ..alignChild('center')
    ..width(50)
    ..height(50)
    ..margin(bottom: 5)
    ..borderRadius(all: 30)
    ..backgroundColor('#F6F5F8');

  final StyleClass actionsItemStyle = StyleClass()..margin(vertical: 20.0);

  final TextStyle actionsItemTextStyle =
  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13);
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Division(
      style: settingsStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(

            child: Text(" Se connecter "),
            onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder:(_) =>LoginScreen())),
            color: Colors.orange,
            textColor: Colors.white,
            splashColor: Colors.grey,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              print("Tiklandi");
            },
            child: SettingsItem(Feather.getIconData("briefcase"), '#9F6083',
                'Commandes', 'Toutes vos commandes sont répertoriées.', () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: Checkout(),
                    ),
                  );
                }),
          ),
          SizedBox(height: 30,),
          SettingsItem(Feather.getIconData("settings"), '#FDB78B',
              'Paramètres du compte', 'Paramètres généraux de votre compte', () {
                Navigator.push(
                  context,

                  PageTransition(
                    type: PageTransitionType.fade,
                    child: AccountSettings(),
                  ),
                );
              }),
          SizedBox(height: 30,),
          SettingsItem(
              Feather.getIconData("tag"),
              '#57CFE2',
              'Coupons de réduction',
              'Coupons que vous souhaitez utiliser pour vos achats.', () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Checkout(),
              ),
            );
          }),
          SizedBox(height: 30,),
          SettingsItem(Feather.getIconData("message-circle"), '#606B7E',
              'Mes commentaires', 'Vos commentaires sur les produits', () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Checkout(),
                  ),
                );
              }),
          SizedBox(height: 30,),
          SettingsItem(Feather.getIconData("bell"), '#FB7C7A', 'Notifications',
              "Notifications dans l'application", () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Checkout(),
                  ),
                );
              }),
          SizedBox(height: 30,),
          SettingsItem(Feather.getIconData("help-circle"), '#24ACE9', 'Aide',
              "Voir ici pour obtenir de l'aide", () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Checkout(),
                  ),
                );
              }),
          SizedBox(height: 30,),
        ],

      ),
    );
  }

  final StyleClass settingsStyle = StyleClass();
}

class SettingsItem extends StatefulWidget {
  final IconData icon;
  final String iconBgColor;
  final String title;
  final String description;
  final Function touchItem;

  SettingsItem(this.icon, this.iconBgColor, this.title, this.description,
      this.touchItem);

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Division(
        style: settingsItemStyle
          ..elevation(pressed ? 0 : 50, color: Colors.grey)
          ..scale(pressed ? 0.95 : 1.0),
        gesture: GestureClass()
          ..onTap(widget.touchItem)
          ..onTapDown((details) => setState(() => pressed = true))
          ..onTapUp((details) => setState(() => pressed = false))
          ..onTapCancel(() => setState(() => pressed = false)),
        child: ListView(
          children: <Widget>[
            Division(
              style: StyleClass()
                ..backgroundColor(widget.iconBgColor)
                ..add(settingsItemIconStyle),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: itemTitleTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.description,
                  style: itemDescriptionTextStyle,
                ),
              ],
            )
          ],
        ));
  }

  final StyleClass settingsItemStyle = StyleClass()
    ..alignChild('center')
    ..height(70)
    ..margin(vertical: 10)
    ..borderRadius(all: 15)
    ..backgroundColor('#ffffff')
    ..ripple(true)
    ..animate(300, Curves.easeOut);

  final StyleClass settingsItemIconStyle = StyleClass()
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TextStyle itemTitleTextStyle =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final TextStyle itemDescriptionTextStyle = TextStyle(
      color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12);
}
