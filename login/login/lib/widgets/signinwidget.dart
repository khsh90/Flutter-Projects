import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:login/provider/authstate.dart';
import 'package:provider/provider.dart';

import '../core/res/applicationcons.dart';
import '../model/userlogin.dart';
import '../pages/signup.dart';
import '../pages/userjobsoverviewpage.dart';

class SigninWidget extends StatefulWidget {
  //const SigninWidget({super.key});

  SigninWidget();
  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  bool isLoading = false;
  bool isEmailHasData = false;
  bool isPasswordHasData = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;

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

  Widget cutomElevatedButton({
    required Color btnColor,
    required String btnName,
    required void Function()? btnFunction,
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
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text(btnName),
    );
  }

  final _formKey = GlobalKey<FormState>();

  UserLogin formFieldValues = UserLogin(email: '', password: '');

  Future<void> formFeildLoginButton() async {
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      setState(() {
        isLoading = true;
      });
    });

    try {
      await ApplicationConst.account
          .createEmailSession(
              email: formFieldValues.email, password: formFieldValues.password)
          .then((_) => Navigator.of(context)
              .pushReplacementNamed(UserjobsoverviewPage.route));
      setState(() {
        setState(() {
          isLoading = false;
        });
      });
    } on AppwriteException catch (e) {
      await showAlertMsg('${e.message}');
      setState(() {
        setState(() {
          isLoading = false;
          ;
        });
      });
    } catch (e) {
      showAlertMsg('$e');
      setState(() {
        setState(() {
          isLoading = false;
        });
      });
    }
    setState(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  bool passwordShowkeyboard = true;

  Widget textFormFiled({
    required String labelName,
    TextEditingController? controller,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
    TextInputAction? textInputAction,
    //  required FocusNode focusNode,
    bool secureKeyboard = false,
    required IconData passwordIcon,
    bool showICon = true,
    void Function()? showPasswordIconButtonFunction,
    TextInputType? keyboardInputType,
    String? hintText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: keyboardInputType,
          obscureText: secureKeyboard,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.purple,
              ),
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
              labelStyle: const TextStyle(color: Colors.black)),
          onSaved: saveFunction,
          validator: validationFunction),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(() {
      final isEmailActive = emailController.text.isNotEmpty;
      print(isEmailActive);
      setState(() => isEmailHasData = isEmailActive);
    });

    passwordController.addListener(() {
      final isPasswordActive = passwordController.text.isNotEmpty;

      print(isPasswordActive);
      setState(() => isPasswordHasData = isPasswordActive);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                labelName: 'Email',
                                keyboardInputType: TextInputType.emailAddress,
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      formFieldValues = UserLogin(
                                          email: entredValue!,
                                          password: formFieldValues.password)
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter an email';
                                  }

                                  return null;
                                },
                                showICon: false,
                                passwordIcon: Icons.remove_red_eye,
                                hintText: 'like test@test.com'),
                            textFormFiled(
                                controller: passwordController,
                                textInputAction: TextInputAction.done,
                                labelName: 'Password',
                                icon: Icons.lock,
                                saveFunction: (entredValue) => {
                                      formFieldValues = UserLogin(
                                          email: formFieldValues.email,
                                          password: entredValue!)
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter a password';
                                  }

                                  return null;
                                },
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
                          btnFunction: (isEmailHasData && isPasswordHasData)
                              ? formFeildLoginButton
                              : null),
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
