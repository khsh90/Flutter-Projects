import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/model/Usersignup.dart';
import 'package:login/model/userlogin.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/userjobsoverviewpage.dart';
import 'package:login/provider/authstate.dart';
import 'package:provider/provider.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  Future<void> showAlertMsg(String messgae) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Please attention'),
        content: Text(messgae),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 99, 22, 112)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'))
        ],
      ),
    );
  }

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
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 3,
      ),
      child: Text(btnName),
    );
  }

  final _formKey = GlobalKey<FormState>();

  UserSignUp formFieldValues = UserSignUp(email: '', password: '', name: '');

  Future<void> formFeildLoginButton() async {
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
    try {
      await Provider.of<AuthStateProvider>(context, listen: false).signUp(
          email: formFieldValues.email,
          password: formFieldValues.password,
          name: formFieldValues.name);
      await showAlertMsg(
          'Your account has been created sucessfully please click on ok to enter with your account');
      Navigator.of(context).pushReplacementNamed(SigninPage.route);
    } on AppwriteException catch (e) {
      showAlertMsg('${e.message}');
    } catch (e) {
      showAlertMsg('$e');
    }
  }

  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final passwordController = TextEditingController();

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
                    child: Stack(children: [
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
                                labelName: 'Name',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                  formFieldValues = UserSignUp(
                                      userId: formFieldValues.userId,
                                      email: formFieldValues.email,
                                      password: formFieldValues.password,
                                      name: entredValue!)
                                },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                passwordIcon: Icons.remove_red_eye,
                                showICon: false,
                                fillColor: Colors.purple[100],
                              ),
                              textFormFiled(
                                labelName: 'Email',
                                icon: Icons.email,
                                saveFunction: (entredValue) => {
                                  formFieldValues = UserSignUp(
                                      userId: formFieldValues.userId,
                                      email: entredValue!,
                                      password: formFieldValues.password,
                                      name: formFieldValues.name)
                                },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter you email';
                                  }
                                  return null;
                                },
                                passwordIcon: Icons.remove_red_eye,
                                showICon: false,
                                fillColor: Colors.purple[100],
                              ),

                              textFormFiled(
                                labelName: 'Password',
                                icon: Icons.lock,
                                saveFunction: (entredValue) => {
                                  formFieldValues = UserSignUp(
                                      userId: formFieldValues.userId,
                                      email: formFieldValues.email,
                                      password: entredValue!,
                                      name: formFieldValues.name)
                                },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
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
                                },
                                fillColor: Colors.purple[100],
                              ),
                              //         textFormFiled(
                              //           labelName: 'Confirm Password',
                              //           icon: Icons.lock,
                              //           saveFunction: (entredValue) => {},
                              //           validationFunction: (entredValue) {
                              //             if (entredValue != null &&
                              //                 entredValue.isEmpty) {
                              //               return 'Please enter a password';
                              //             }
                              //             if (entredValue != null &&
                              //                 entredValue != passwordController.text) {
                              //               return 'Password not match';
                              //             }
                              //             return null;
                              //           },
                              //           //    focusNode: confirmPasswordFocusNode,
                              //           secureKeyboard: confirmPasswordShowkeyboard,
                              //           passwordIcon: confirmPasswordShowkeyboard
                              //               ? Icons.remove_red_eye
                              //               : Icons.remove_red_eye_outlined,
                              //           showPasswordIconButtonFunction: () {
                              //             setState(() {
                              //               confirmPasswordShowkeyboard =
                              //                   !confirmPasswordShowkeyboard;
                              //             });
                              //           },
                              //           fillColor: Colors.purple[100],
                              //         ),
                              //       ],
                              //     )),
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
                ])))));
  }
}
