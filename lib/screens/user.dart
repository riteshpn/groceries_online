import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceries_online/provider/dark_theme_provider.dart';
import 'package:groceries_online/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Hi, ',
                        style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'MyName',
                          style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('MY NAME IS PRESSED');
                            }),
                    ])),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(text: 'Email@gmail.com', color: color, textSize: 18),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTile(
                  title: 'Address 1',
                  subtitle: 'My subtitle',
                  icon: IconlyBold.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                  color: color,
                ),
                _listTile(
                  title: 'Order',
                  icon: IconlyBold.bag,
                  onPressed: () {},
                  color: color,
                ),
                _listTile(
                  title: 'Whislist',
                  icon: IconlyBold.heart,
                  onPressed: () {},
                  color: color,
                ),
                _listTile(
                  title: 'View',
                  icon: IconlyBold.show,
                  onPressed: () {},
                  color: color,
                ),
                _listTile(
                    title: 'Forgot Password',
                    icon: IconlyBold.unlock,
                    onPressed: () {},
                    color: color),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark Mode' : 'Light Mode',
                    color: color,
                    textSize: 18,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTile(
                    title: 'Logout',
                    icon: IconlyBold.logout,
                    onPressed: () {
                      _showLogoutDialog();
                    },
                    color: color)
              ]),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Sign out',
              )
            ],
          ),
          content: Text('Do You wanna sign out?'),
          actions: [
            TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: 'Cancel',
                  textSize: 18,
                )),
            TextButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.red,
                  text: 'OK',
                  textSize: 18,
                ))
          ],
        );
      },
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('update'),
          content: TextField(
            controller: _addressTextController,
            maxLines: 5,
            // onChanged: (value) {
            //   print(
            //       '_addressTextController.text ${_addressTextController.text}');
            // },
            decoration: const InputDecoration(
              hintText: 'Your address',
            ),
          ),
          actions: [TextButton(onPressed: () {}, child: const Text('Update'))],
        );
      },
    );
  }
}

// widget of list tile //

Widget _listTile(
    {required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color}) {
  return ListTile(
    title: TextWidget(
      text: title,
      color: color,
      textSize: 20,
      isTitle: true,
    ),
    subtitle: TextWidget(
      text: subtitle == null ? "" : subtitle,
      color: color,
      textSize: 18,
    ),
    leading: Icon(icon),
    trailing: const Icon(
      IconlyBold.arrowRight2,
    ),
    onTap: () {
      onPressed();
    },
  );
}
