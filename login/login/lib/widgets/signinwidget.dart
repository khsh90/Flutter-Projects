import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/objectbox.g.dart';
import 'package:login/pages/loginsucuessuserpage.dart';
import 'package:login/pages/signin.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:provider/provider.dart';

import '../pages/signup.dart';

class SigninWidget extends StatefulWidget {
  @override
  State<SigninWidget> createState() => _SigninWidgetState();
  final Store store;
  SigninWidget(this.store);
}

class _SigninWidgetState extends State<SigninWidget> {
  void showAlertMsg(String messgae) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Please attention'),
        content: Text(messgae),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 99, 22, 112)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'))
        ],
      ),
    );
  }

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
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();

    // Provider.of<UserCreditials>(context, listen: false)
    //     .findByUserNameAndPassword(
    //   widget.store,
    //   formFieldValues,
    // );

    Query<UserCredintial> query = widget.store
        .box<UserCredintial>()
        .query(UserCredintial_.userName
            .equals(formFieldValues.userName)
            .and(UserCredintial_.password.equals(formFieldValues.password)))
        .build();
    List<UserCredintial> userData = query.find();

    query.close();
    if (userData.isNotEmpty) {
      print('login success');
      Navigator.of(context).pushNamed(LoginSucessUserPage.route, arguments: {
        'id': formFieldValues.id,
        'userName': formFieldValues.userName,
        'password': formFieldValues.password
      });
    } else {
      print('login Faild');
      showAlertMsg('User name or password invalid , please check');
    }

    // print(formFieldValues.userName);
    // print(formFieldValues.password);
  }

  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  void getFocus() {
    if (userNameFocusNode.hasFocus) {
      setState(() {});
    }
    if (passwordFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    userNameFocusNode.addListener(getFocus);
  }

  @override
  void dispose() {
    super.dispose();
    userNameFocusNode.removeListener(getFocus);
  }

  bool passwordShowkeyboard = true;

  Widget textFormFiled({
    required String labelName,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
    required FocusNode focusNode,
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
          validator: validationFunction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          // color: Colors.red,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/main_top.png',
                    width: 110,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/login_bottom.png',
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
                        'Login',
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
                        'assets/icons/login.svg',
                        width: MediaQuery.of(context).size.width - 100,
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
                                      formFieldValues = UserCredintial(
                                          id: formFieldValues.id,
                                          userName: entredValue!,
                                          password: formFieldValues.password)
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter a user name';
                                  }
                                  return null;
                                },
                                focusNode: userNameFocusNode,
                                showICon: false,
                                passwordIcon: Icons.remove_red_eye),
                            textFormFiled(
                                labelName: 'Password',
                                icon: Icons.lock,
                                saveFunction: (entredValue) => {
                                      formFieldValues = UserCredintial(
                                          id: formFieldValues.id,
                                          userName: formFieldValues.userName,
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      cutomElevatedButton(
                          btnColor: const Color.fromARGB(255, 99, 22, 112),
                          btnName: 'Login',
                          btnFunction: formFeildLoginButton),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account ?",
                            style: TextStyle(color: Colors.purple),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(SignUPPage.route);
                              },
                              child: const Text('Sign Up',
                                  style: TextStyle(color: Colors.purple)))
                        ],
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
