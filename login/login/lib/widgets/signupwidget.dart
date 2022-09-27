import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/pages/loginsucuessuserpage.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';
import 'package:login/pages/userpage.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;
import '../objectbox.g.dart';

class SignupWidget extends StatefulWidget {
  final Store store;

  SignupWidget(this.store);
  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
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

  // late Box<UserCredintial> storeBox = _store.box<UserCredintial>();
  bool isInitized = false;

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

  UserCredintial formFieldValues = UserCredintial(
      firstName: '',
      lastName: '',
      mobilePhone: 0000000000,
      country: '',
      city: '',
      area: '',
      password: '');

  void formFeildLoginButton() {
    // _store.box<UserCredintial>().removeAll();
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
    // Query<UserCredintial> query = widget.store
    //     .box<UserCredintial>()
    //     .query(UserCredintial_.userName.equals(formFieldValues.userName))
    //     .build();
    // List<UserCredintial> userData = query.find();
    // query.close();

    // if (userData.isEmpty) {

    try {
      Provider.of<UserCreditials>(context, listen: false)
          .addUser(userCred: formFieldValues, store: widget.store);

      Navigator.of(context).pushReplacementNamed(LoginSucessUserPage.route,
          arguments: formFieldValues.id
          //     arguments: {
          //   'id': formFieldValues.id,
          //   // 'firstName': formFieldValues.firstName,
          //   // 'lastName': formFieldValues.lastName,
          //   // 'userName': formFieldValues.userName,
          //   // 'password': formFieldValues.password
          // }

          );
    } on UniqueViolationException catch (_) {
      return showAlertMsg('Mobile phone already exists');
    } catch (error) {
      print(error);
    }

    // } else if (userData.isNotEmpty) {
    //   showAlertMsg('user already exists');
    // }
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
    //userNameFocusNode.addListener(getFocus);

    // getApplicationDocumentsDirectory().then((dir) => widget.store =
    //     Store(getObjectBoxModel(), directory: p.join(dir.path, 'objectbox')));

    // // formFeildLoginButton();
    // Provider.of<UserCreditials>(context, listen: false)
    //     .storeInitilization(widget.store)
    //     .then((_) {
    //   setState(() {
    //     isInitized = true;
    //   });
    // });
    //   setState(() {
    //     isInitized = true;
    //   });
  }

  @override
  void dispose() {
    super.dispose();

    //  userNameFocusNode.removeListener(getFocus);
  }

  bool passwordShowkeyboard = true;
  bool confirmPasswordShowkeyboard = true;
  Widget textFormFiled({
    required String labelName,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
    //  required FocusNode focusNode,
    TextEditingController? buttonController,
    bool secureKeyboard = false,
    required IconData passwordIcon,
    bool showICon = true,
    void Function()? showPasswordIconButtonFunction,
    TextInputType? keyboardInputType,
    String? hintText,
    String? initialVaue,
    bool readInputOnly = false,
    Color? fillColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        readOnly: readInputOnly,
        initialValue: initialVaue,
        // focusNode: focusNode,
        keyboardType: keyboardInputType,
        obscureText: secureKeyboard,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.purple),
            suffixIcon: Visibility(
                visible: showICon,
                child: IconButton(
                    onPressed: showPasswordIconButtonFunction,
                    icon: Icon(passwordIcon))),
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            filled: true,
            fillColor: fillColor,
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
            labelStyle: const TextStyle(color: Colors.black)),
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
          body: SizedBox(
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
                      height: 8,
                    ),
                    SvgPicture.asset(
                      'assets/icons/signup.svg',
                      width: MediaQuery.of(context).size.width - 250,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            textFormFiled(
                              labelName: 'First Name',
                              icon: Icons.person,
                              saveFunction: (entredValue) => {
                                formFieldValues = UserCredintial(
                                    id: formFieldValues.id,
                                    firstName: entredValue!,
                                    lastName: formFieldValues.lastName,
                                    mobilePhone: formFieldValues.mobilePhone,
                                    password: formFieldValues.password)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter first name';
                                }
                                return null;
                              },
                              //  focusNode: userNameFocusNode,
                              passwordIcon: Icons.remove_red_eye,
                              showICon: false,
                              fillColor: Colors.purple[100],
                            ),
                            textFormFiled(
                              labelName: 'Last name',
                              icon: Icons.person,
                              saveFunction: (entredValue) => {
                                formFieldValues = UserCredintial(
                                    id: formFieldValues.id,
                                    firstName: formFieldValues.firstName,
                                    lastName: entredValue!,
                                    mobilePhone: formFieldValues.mobilePhone,
                                    password: formFieldValues.password)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter a last name';
                                }
                                return null;
                              },
                              //  focusNode: userNameFocusNode,
                              passwordIcon: Icons.remove_red_eye,
                              showICon: false,
                              fillColor: Colors.purple[100],
                            ),
                            textFormFiled(
                              labelName: 'Mobile phone',
                              icon: Icons.person,
                              saveFunction: (entredValue) => {
                                formFieldValues = UserCredintial(
                                    id: formFieldValues.id,
                                    firstName: formFieldValues.firstName,
                                    lastName: formFieldValues.lastName,
                                    mobilePhone: int.tryParse(entredValue!)!,
                                    country: formFieldValues.country,
                                    city: formFieldValues.city,
                                    area: formFieldValues.area,
                                    password: formFieldValues.password)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter the mobile phone';
                                }

                                if (entredValue!.length != 10) {
                                  return 'mobile phone shall be with 10 didgits';
                                }

                                if (int.tryParse(entredValue) == null) {
                                  return 'Please enter a mobile number';
                                }
                                return null;
                              },
                              //  focusNode: userNameFocusNode,
                              passwordIcon: Icons.remove_red_eye,
                              showICon: false,
                              keyboardInputType: TextInputType.phone,
                              hintText: 'Start with 079 , 077 ,078',
                              fillColor: Colors.purple[100],
                            ),
                            textFormFiled(
                                labelName: 'Country',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      formFieldValues = UserCredintial(
                                        id: formFieldValues.id,
                                        firstName: formFieldValues.firstName,
                                        lastName: formFieldValues.lastName,
                                        mobilePhone:
                                            formFieldValues.mobilePhone,
                                        country: entredValue!,
                                        city: formFieldValues.city,
                                        area: formFieldValues.area,
                                        password: formFieldValues.password,
                                      )
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter the country';
                                  }
                                  return null;
                                },
                                //  focusNode: userNameFocusNode,
                                passwordIcon: Icons.remove_red_eye,
                                showICon: false,
                                initialVaue: 'Jordan',
                                readInputOnly: true),
                            textFormFiled(
                              labelName: 'City',
                              icon: Icons.person,
                              saveFunction: (entredValue) => {
                                formFieldValues = UserCredintial(
                                    id: formFieldValues.id,
                                    firstName: formFieldValues.firstName,
                                    lastName: formFieldValues.lastName,
                                    mobilePhone: formFieldValues.mobilePhone,
                                    country: formFieldValues.country,
                                    city: entredValue!,
                                    area: formFieldValues.area,
                                    password: formFieldValues.password)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter the city';
                                }
                                return null;
                              },
                              //  focusNode: userNameFocusNode,
                              passwordIcon: Icons.remove_red_eye,
                              showICon: false,
                              fillColor: Colors.purple[100],
                            ),
                            textFormFiled(
                              labelName: 'Area',
                              icon: Icons.person,
                              saveFunction: (entredValue) => {
                                formFieldValues = UserCredintial(
                                    id: formFieldValues.id,
                                    firstName: formFieldValues.firstName,
                                    lastName: formFieldValues.lastName,
                                    mobilePhone: formFieldValues.mobilePhone,
                                    country: formFieldValues.country,
                                    city: formFieldValues.city,
                                    area: entredValue!,
                                    password: formFieldValues.password)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter the area';
                                }
                                return null;
                              },
                              //  focusNode: userNameFocusNode,
                              passwordIcon: Icons.remove_red_eye,
                              showICon: false,
                              fillColor: Colors.purple[100],
                            ),
                            textFormFiled(
                              labelName: 'Password',
                              icon: Icons.lock,
                              saveFunction: (entredValue) => {
                                formFieldValues = UserCredintial(
                                    id: formFieldValues.id,
                                    firstName: formFieldValues.firstName,
                                    lastName: formFieldValues.lastName,
                                    country: formFieldValues.country,
                                    city: formFieldValues.city,
                                    area: formFieldValues.area,
                                    mobilePhone: formFieldValues.mobilePhone,
                                    password: entredValue!)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                              // focusNode: passwordFocusNode,
                              buttonController: passwordController,
                              secureKeyboard: passwordShowkeyboard,
                              passwordIcon: passwordShowkeyboard
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              showPasswordIconButtonFunction: () {
                                setState(() {
                                  passwordShowkeyboard = !passwordShowkeyboard;
                                });
                              },
                              fillColor: Colors.purple[100],
                            ),
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
                                    entredValue != passwordController.text) {
                                  return 'Password not match';
                                }
                                return null;
                              },
                              //    focusNode: confirmPasswordFocusNode,
                              secureKeyboard: confirmPasswordShowkeyboard,
                              passwordIcon: confirmPasswordShowkeyboard
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              showPasswordIconButtonFunction: () {
                                setState(() {
                                  confirmPasswordShowkeyboard =
                                      !confirmPasswordShowkeyboard;
                                });
                              },
                              fillColor: Colors.purple[100],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    cutomElevatedButton(
                        btnColor: const Color.fromARGB(255, 99, 22, 112),
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
                                  .pushReplacementNamed(SigninPage.route);
                            },
                            child: const Text('Sign In',
                                style: TextStyle(color: Colors.purple)))
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
