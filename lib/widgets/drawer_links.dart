import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerLinks extends StatelessWidget {
  const DrawerLinks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            color: Colors.black,
            child: Text(
              'Cook it easy!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Content(
            icon: Icons.restaurant,
            title: 'Food',
            navtapHandler: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          Content(
            icon: Icons.settings,
            title: 'Settings',
            navtapHandler: () {
              Navigator.of(context).pushNamed('/filtersScreen');
            },
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
    this.title,
    this.icon,
    this.navtapHandler,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function navtapHandler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: navtapHandler,
    );
  }
}
