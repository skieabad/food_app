import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  final Function settings;
  final Map<String, bool> currentSettings;
  const SettingsScreen({
    Key key,
    @required this.settings,
    @required this.currentSettings,
  }) : super(key: key);

  static const routeName = '/filtersScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentSettings['gluten'];
    _isLactoseFree = widget.currentSettings['lactose'];
    _isVegan = widget.currentSettings['vegan'];
    _isVegetarian = widget.currentSettings['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: GoogleFonts.lato(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedSettings = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.settings(selectedSettings);
              showToast("Saved successfully", context: context);
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              'Adjust your food selection',
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchSettings(
                  activecolor: Colors.black,
                  currentValue: _isGlutenFree,
                  description: 'Display only gluten free foods',
                  title: 'Gluten free',
                  updateValue: (val) {
                    setState(() {
                      _isGlutenFree = val;
                    });
                  },
                ),
                SwitchSettings(
                  activecolor: Colors.black,
                  currentValue: _isLactoseFree,
                  description: 'Display only lactose free foods',
                  title: 'Lactose free',
                  updateValue: (val) {
                    setState(() {
                      _isLactoseFree = val;
                    });
                  },
                ),
                SwitchSettings(
                  activecolor: Colors.black,
                  currentValue: _isVegan,
                  description: 'Display only vegan foods',
                  title: 'Vegan',
                  updateValue: (val) {
                    setState(() {
                      _isVegan = val;
                    });
                  },
                ),
                SwitchSettings(
                  activecolor: Colors.black,
                  currentValue: _isVegetarian,
                  description: 'Display only vegetarian foods',
                  title: 'Vegetarian',
                  updateValue: (val) {
                    setState(() {
                      _isVegetarian = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchSettings extends StatelessWidget {
  final String title;
  final String description;
  final Color activecolor;
  final bool currentValue;
  final Function updateValue;
  const SwitchSettings({
    Key key,
    @required this.title,
    @required this.description,
    @required this.activecolor,
    @required this.currentValue,
    @required this.updateValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      activeColor: activecolor,
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}



