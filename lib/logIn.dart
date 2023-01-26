import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_explorer/routes/routeName.dart';

// ignore: camel_case_types
class LogIn_page extends StatefulWidget {
  const LogIn_page({Key? key}) : super(key: key);

  @override
  State<LogIn_page> createState() => _LogIn_pageState();
}

// ignore: camel_case_types
class _LogIn_pageState extends State<LogIn_page> {
  var userName = TextEditingController();
  var password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Log In',
          style: TextStyle(fontSize: 35),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Don't Have An Acount  ",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUpPage);
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Positioned(
                bottom: 50,
                right: 50,
                left: 50,
                top: MediaQuery.of(context).size.height * 0.03,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/87651/earth-blue-planet-globe-planet-87651.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text(
                                'Welcome To World Explorer',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                      'Believe in yourself.'),
                                  TypewriterAnimatedText(
                                      'You are braver than you think, '),
                                  TypewriterAnimatedText(
                                      ' more talented than you know,'),
                                  TypewriterAnimatedText(
                                      'capable of more than you imagine.'),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'UserName Cannot Be Empty';
                                  }
                                  return null;
                                },
                                controller: userName,
                                decoration: const InputDecoration(
                                  hintText: 'Usama Ahmad',
                                  prefixIcon: Icon(Icons.comment),
                                  labelText: 'Enter UserName',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password Cannot Be Empty';
                                  }
                                  return null;
                                },
                                controller: password,
                                decoration: const InputDecoration(
                                  hintText: '123456',
                                  labelText: 'Enter Password',
                                  prefixIcon: Icon(Icons.password),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.forgetpassword);
                                  },
                                  child: const Text('Forget Password',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.redAccent)),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              ElevatedButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      var user = prefs.getString('keyU');
                                      var pass = prefs.getString('keyP');
                                      if (user.toString() ==
                                          userName.text.toString()) {
                                        if (pass.toString() ==
                                            password.text.toString()) {
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushNamed(
                                              context, RoutesName.map);
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Password Not Match')));
                                        }
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'UserName Not Match')));
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text(
                                    'SignIn',
                                    style: TextStyle(fontSize: 25),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
