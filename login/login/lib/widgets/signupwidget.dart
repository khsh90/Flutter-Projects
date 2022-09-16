import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/userpage.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../objectbox.g.dart';
import 'package:path/path.dart' as p;

class SignupWidget extends StatefulWidget {
  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late Store _store;
  Admin? admin;
  bool hasBeenInitialized = false;

  Stream<List<UserCredintial>>? _stream;
  Widget cutomElevatedButton({
    required Color btnColor,
    required String btnName,
    required void Function() btnFunction,
  }) {
    return ElevatedButton(
      onPressed: btnFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 45),
        primary: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 3,
      ),
      child: Text(btnName),
    );
  }

  final _formKey = GlobalKey<FormState>();

  UserCredintial formFieldValues = UserCredintial(userName: '', password: '');

  void formFeildLoginButton() {
    // _store.box<UserCredintial>().removeAll();
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
    Provider.of<UserCreditials>(context, listen: false)
        .addUser(userCred: formFieldValues);
    Navigator.of(context).pushReplacementNamed(UserMAnagementPage.route);

    _store.box<UserCredintial>().put(formFieldValues);

    print(_store.box<UserCredintial>().put(formFieldValues));
    print(_store.box<UserCredintial>().getAll());
    // print(formFieldValues.userName);
    // print(formFieldValues.password);
    // print('controller:${passwordController.text}');
  }

  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final passwordController = TextEditingController();
  void getFocus() {
    if (userNameFocusNode.hasFocus) {
      setState(() {});
    }
    if (passwordFocusNode.hasFocus) {
      setState(() {});
    }

    if (confirmPasswordFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    userNameFocusNode.addListener(getFocus);

    getApplicationDocumentsDirectory().then((dir) => {
          _store = Store(getObjectBoxModel(),
              directory: p.join(dir.path, 'objectbox')),

          //     .map((qury) => qury.find());
          if (Admin.isAvailable())
            {
              admin = Admin(_store),
            }
        });

    setState(() {
      // _stream = _store
      //     ?.box<UserCredintials>()
      //     .query()
      //     .watch()

      hasBeenInitialized = true;
    });

    // formFeildLoginButton();
  }

  @override
  void dispose() {
    super.dispose();
    userNameFocusNode.removeListener(getFocus);
    _store.close();
    admin?.close();
  }

  bool passwordShowkeyboard = true;
  bool confirmPasswordShowkeyboard = true;
  Widget textFormFiled({
    required String labelName,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
    required FocusNode focusNode,
    TextEditingController? buttonController,
    bool secureKeyboard = false,
    required IconData passwordIcon,
    bool showICon = true,
    void Function()? showPasswordIconButtonFunction,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        focusNode: focusNode,
        obscureText: secureKeyboard,
        decoration: InputDecoration(
            suffixIcon: Visibility(
                visible: showICon,
                child: IconButton(
                    onPressed: showPasswordIconButtonFunction,
                    icon: Icon(passwordIcon))),
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Colors.black : Colors.purple,
            ),
            filled: true,
            fillColor: Colors.purple[100],
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            labelText: labelName,
            labelStyle: TextStyle(
                color: focusNode.hasFocus ? Colors.black : Colors.purple)),
        onSaved: saveFunction,
        validator: validationFunction,
        controller: buttonController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: !hasBeenInitialized
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  // color: Colors.red,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Positioned(
                          child: Image.asset(
                            'assets/images/signup_top.png',
                            width: 110,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Image.asset(
                            'assets/images/main_bottom.png',
                            width: 75,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontFamily: 'Courgette',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SvgPicture.asset(
                                'assets/icons/signup.svg',
                                width: MediaQuery.of(context).size.width - 205,
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      textFormFiled(
                                          labelName: 'UserName',
                                          icon: Icons.person,
                                          saveFunction: (entredValue) => {
                                                formFieldValues =
                                                    UserCredintial(
                                                        userName: entredValue!,
                                                        password:
                                                            formFieldValues
                                                                .password)
                                              },
                                          validationFunction: (entredValue) {
                                            if (entredValue != null &&
                                                entredValue.isEmpty) {
                                              return 'Please enter a user name';
                                            }
                                            return null;
                                          },
                                          focusNode: userNameFocusNode,
                                          passwordIcon: Icons.remove_red_eye,
                                          showICon: false),
                                      textFormFiled(
                                          labelName: 'Password',
                                          icon: Icons.lock,
                                          saveFunction: (entredValue) => {
                                                formFieldValues =
                                                    UserCredintial(
                                                        userName:
                                                            formFieldValues
                                                                .userName,
                                                        password: entredValue!)
                                              },
                                          validationFunction: (entredValue) {
                                            if (entredValue != null &&
                                                entredValue.isEmpty) {
                                              return 'Please enter a password';
                                            }
                                            return null;
                                          },
                                          focusNode: passwordFocusNode,
                                          buttonController: passwordController,
                                          secureKeyboard: passwordShowkeyboard,
                                          passwordIcon: passwordShowkeyboard
                                              ? Icons.remove_red_eye
                                              : Icons.remove_red_eye_outlined,
                                          showPasswordIconButtonFunction: () {
                                            setState(() {
                                              passwordShowkeyboard =
                                                  !passwordShowkeyboard;
                                            });
                                          }),
                                      textFormFiled(
                                          labelName: 'Confirm Password',
                                          icon: Icons.lock,
                                          saveFunction: (entredValue) => {},
                                          validationFunction: (entredValue) {
                                            if (entredValue != null &&
                                                entredValue.isEmpty) {
                                              return 'Please enter a password';
                                            }
                                            if (entredValue != null &&
                                                entredValue !=
                                                    passwordController.text) {
                                              return 'Password not match';
                                            }
                                            return null;
                                          },
                                          focusNode: confirmPasswordFocusNode,
                                          secureKeyboard:
                                              confirmPasswordShowkeyboard,
                                          passwordIcon:
                                              confirmPasswordShowkeyboard
                                                  ? Icons.remove_red_eye
                                                  : Icons
                                                      .remove_red_eye_outlined,
                                          showPasswordIconButtonFunction: () {
                                            setState(() {
                                              confirmPasswordShowkeyboard =
                                                  !confirmPasswordShowkeyboard;
                                            });
                                          }),
                                    ],
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              cutomElevatedButton(
                                  btnColor:
                                      const Color.fromARGB(255, 99, 22, 112),
                                  btnName: 'Sign Up',
                                  btnFunction: formFeildLoginButton),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account ?",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                SigninPage.route);
                                      },
                                      child: const Text('Sign In',
                                          style:
                                              TextStyle(color: Colors.purple)))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
