import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.shopping_bag,
                        size: 60,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'E-Commerce',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The best place to shop online',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          LoginButtons(
              buttonColor: Colors.grey[200],
              icon: Icons.camera,
              iconColor: Colors.green,
              label: 'Log in via Google',
              textColor: Colors.black),
          LoginButtons(
              buttonColor: Colors.blue[900],
              icon: Icons.facebook,
              iconColor: Colors.white,
              label: 'Log in via Facebook',
              textColor: Colors.white),
          const LoginButtons(
              buttonColor: Color.fromARGB(255, 250, 23, 6),
              icon: Icons.account_box,
              iconColor: Colors.white,
              label: 'Log in via Email',
              textColor: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New to e-commerce?'),
              TextButton(
                onPressed: _tapped,
                child: const Text('Register'),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _tapped() {
    return setState(() {
      Navigator.pushNamed(context, '/register');
    });
  }
}

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    Key? key,
    required this.buttonColor,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.textColor,
  }) : super(key: key);

  final IconData icon;
  final Color? iconColor;
  final String label;
  final Color? textColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: width * 0.9,
        height: height * 0.075,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
                  (Set<MaterialState> states) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70));
              }),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return buttonColor;
              }),
              elevation: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                return 0;
              }),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 35,
                ),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ],
            )),
      ),
    );
  }
}
