import 'package:commerce_app/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[100],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(-15),
                child: TabBar(
                  enableFeedback: false,
                  splashFactory: NoSplash.splashFactory,
                  indicatorColor: Colors.red,
                  labelStyle: const TextStyle(fontSize: 26),
                  unselectedLabelStyle: const TextStyle(fontSize: 24),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[700],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  tabs: const [
                    Text('Register',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    Text('Login',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                  ],
                ),
              )),
          body: Center(
            child: TabBarView(
              children: [
                RegisterTab(width: width, height: height),
                const LoginTab(),
              ],
            ),
          )),
    );
  }
}

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: 'Username/Email',
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye_outlined))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot password'))
                ],
              ),
              const LoginButtons(
                  buttonColor: Color.fromARGB(255, 247, 27, 11),
                  icon: Icons.login,
                  iconColor: Colors.white,
                  label: 'Login',
                  textColor: Colors.white),
              const SizedBox(height: 40),
              Row(
                children: const [
                  Expanded(
                      child: Divider(
                    thickness: 2,
                    height: 1,
                    endIndent: 20,
                  )),
                  Text('Or Connect With'),
                  Expanded(child: Divider(thickness: 2, height: 1, indent: 20)),
                ],
              ),
              const SizedBox(height: 10),
              LoginButtons(
                  buttonColor: Colors.grey[200],
                  icon: Icons.camera,
                  iconColor: Colors.green,
                  label: 'Login via Google',
                  textColor: Colors.black),
              const SizedBox(height: 5),
              LoginButtons(
                  buttonColor: Colors.blue[900],
                  icon: Icons.facebook,
                  iconColor: Colors.white,
                  label: 'Login via Facebook',
                  textColor: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to ecommerce?',
                      style: TextStyle(color: Colors.grey[700])),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RegisterTab extends StatefulWidget {
  const RegisterTab({Key? key, required this.width, required this.height})
      : super(key: key);

  final double width;
  final double height;

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20),
      children: [
        Column(
          children: [
            const SizedBox(height: 20),

            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline),
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: 'Set your password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.message_outlined),
                      hintText: 'Enter Email Code',
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    minimumSize:
                        Size(widget.width * 0.24, widget.height * 0.05),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                  ),
                  onPressed: () {},
                  child: const Text('Send'),
                ),
              ],
            ),
            // Code to write
            //    Ask whether to register as a buyer or seller?
            //

            const SizedBox(height: 30),
            const LoginButtons(
                buttonColor: Color.fromARGB(255, 241, 33, 18),
                icon: Icons.edit,
                iconColor: Colors.white,
                label: 'Create Account',
                textColor: Colors.white),
            const SizedBox(height: 30),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1, endIndent: 13)),
                Text('Or Connect with'),
                Expanded(child: Divider(thickness: 1, indent: 13)),
              ],
            ),
            const SizedBox(height: 12),
            LoginButtons(
                buttonColor: Colors.grey[200],
                icon: Icons.camera,
                iconColor: Colors.green,
                label: 'Register via Google',
                textColor: Colors.black),
            const SizedBox(height: 5),
            LoginButtons(
                buttonColor: Colors.blue[900],
                icon: Icons.facebook_outlined,
                iconColor: Colors.white,
                label: 'Register via Facebook',
                textColor: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an Account?'),
                const SizedBox(width: 5),
                TextButton(
                  onPressed: () {},
                  child: const Text('Login'),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
