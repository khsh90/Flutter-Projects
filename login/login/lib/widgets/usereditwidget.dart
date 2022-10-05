import 'package:flutter/material.dart';

class UserEditWidget extends StatefulWidget {
  @override
  State<UserEditWidget> createState() => _UserEditWidgettState();
}

class _UserEditWidgettState extends State<UserEditWidget> {
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

  void formFeildLoginButton() {
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
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

  var initialUSerData = {
    'fisrtName': '',
    'lastName': '',
    'mobilePhone': '',
    'country': '',
    'city': '',
    'area': '',
    'password': '',
  };

  bool passwordShowkeyboard = true;

  Widget textFormFiled({
    required String labelName,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
    //required FocusNode focusNode,
    bool secureKeyboard = false,
    required IconData passwordIcon,
    bool showICon = true,
    void Function()? showPasswordIconButtonFunction,
    required initialUserCredintial,
    TextInputType? keyboardInputType,
    String? hintText,
    bool readInputOnly = false,
    Color? fillColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
          readOnly: readInputOnly,
          keyboardType: keyboardInputType,
          initialValue: initialUserCredintial,
          //  focusNode: focusNode,
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
          validator: validationFunction),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userId = ModalRoute.of(context)?.settings.arguments as int;

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
                      Text(
                        'Edit user credintial:$userId',
                        style: const TextStyle(
                            fontFamily: 'Courgette',
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // SvgPicture.asset(
                      //   'assets/icons/login.svg',
                      //   width: MediaQuery.of(context).size.width - 270,
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            textFormFiled(
                              initialUserCredintial:
                                  initialUSerData['fisrtName'],
                              labelName: 'First Name',
                              icon: Icons.person,
                              saveFunction: (entredValue) => {
                                // formFieldValues = UserCredintial(
                                //     id: formFieldValues.id,
                                //     firstName: entredValue!,
                                //     lastName: formFieldValues.lastName,
                                //     mobilePhone: formFieldValues.mobilePhone,
                                //     country: formFieldValues.country,
                                //     city: formFieldValues.city,
                                //     area: formFieldValues.area,
                                //     password: formFieldValues.password)
                              },
                              validationFunction: (entredValue) {
                                if (entredValue != null &&
                                    entredValue.isEmpty) {
                                  return 'Please enter the fist name';
                                }
                                return null;
                              },
                              //  focusNode: userNameFocusNode,
                              showICon: false,
                              passwordIcon: Icons.remove_red_eye,
                              fillColor: Colors.purple[100],
                            ),
                            textFormFiled(
                                initialUserCredintial:
                                    initialUSerData['lastName'],
                                labelName: 'Last Name',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      // formFieldValues = UserCredintial(
                                      //     id: formFieldValues.id,
                                      //     firstName: formFieldValues.firstName,
                                      //     lastName: entredValue!,
                                      //     mobilePhone:
                                      //         formFieldValues.mobilePhone,
                                      //     country: formFieldValues.country,
                                      //     city: formFieldValues.city,
                                      //     area: formFieldValues.area,
                                      //     password: formFieldValues.password)
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter the last name';
                                  }
                                  return null;
                                },
                                //  focusNode: userNameFocusNode,
                                showICon: false,
                                passwordIcon: Icons.remove_red_eye,
                                fillColor: Colors.purple[100]),
                            textFormFiled(
                                initialUserCredintial:
                                    initialUSerData['mobilePhone'],
                                labelName: 'Mobile phone',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      // formFieldValues = UserCredintial(
                                      //     id: formFieldValues.id,
                                      //     firstName: formFieldValues.firstName,
                                      //     lastName: formFieldValues.lastName,
                                      //     mobilePhone:
                                      //         int.tryParse(entredValue!)!,
                                      //     country: formFieldValues.country,
                                      //     city: formFieldValues.city,
                                      //     area: formFieldValues.area,
                                      //     password: formFieldValues.password)
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
                                fillColor: Colors.purple[100]),
                            textFormFiled(
                                initialUserCredintial:
                                    initialUSerData['country'],
                                labelName: 'country',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      // formFieldValues = UserCredintial(
                                      //     id: formFieldValues.id,
                                      //     firstName: formFieldValues.firstName,
                                      //     lastName: formFieldValues.lastName,
                                      //     mobilePhone:
                                      //         formFieldValues.mobilePhone,
                                      //     country: entredValue!,
                                      //     city: formFieldValues.city,
                                      //     area: formFieldValues.area,
                                      //     password: formFieldValues.password)
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter country';
                                  }

                                  return null;
                                },
                                //  focusNode: userNameFocusNode,
                                passwordIcon: Icons.remove_red_eye,
                                showICon: false,
                                fillColor: Color.fromARGB(255, 217, 214, 214),
                                readInputOnly: true),
                            textFormFiled(
                                initialUserCredintial: initialUSerData['city'],
                                labelName: 'city',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      // formFieldValues = UserCredintial(
                                      //     id: formFieldValues.id,
                                      //     firstName: formFieldValues.firstName,
                                      //     lastName: formFieldValues.lastName,
                                      //     mobilePhone:
                                      //         formFieldValues.mobilePhone,
                                      //     country: formFieldValues.country,
                                      //     city: entredValue!,
                                      //     area: formFieldValues.area,
                                      //     password: formFieldValues.password)
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
                                fillColor: Colors.purple[100]),
                            textFormFiled(
                                initialUserCredintial: initialUSerData['area'],
                                labelName: 'area',
                                icon: Icons.person,
                                saveFunction: (entredValue) => {
                                      // formFieldValues = UserCredintial(
                                      //     id: formFieldValues.id,
                                      //     firstName: formFieldValues.firstName,
                                      //     lastName: formFieldValues.lastName,
                                      //     mobilePhone:
                                      //         formFieldValues.mobilePhone,
                                      //     country: formFieldValues.country,
                                      //     city: formFieldValues.city,
                                      //     area: entredValue!,
                                      //     password: formFieldValues.password)
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
                                fillColor: Colors.purple[100]),
                            textFormFiled(
                                initialUserCredintial:
                                    initialUSerData['password'],
                                labelName: 'Password',
                                icon: Icons.lock,
                                saveFunction: (entredValue) => {
                                      // formFieldValues = UserCredintial(
                                      //     id: formFieldValues.id,
                                      //     firstName: formFieldValues.firstName,
                                      //     lastName: formFieldValues.lastName,
                                      //     mobilePhone:
                                      //         formFieldValues.mobilePhone,
                                      //     country: formFieldValues.country,
                                      //     city: formFieldValues.city,
                                      //     area: formFieldValues.area,
                                      //     password: entredValue!)
                                    },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                                //  focusNode: passwordFocusNode,
                                secureKeyboard: passwordShowkeyboard,
                                passwordIcon: passwordShowkeyboard
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                showPasswordIconButtonFunction: () {
                                  setState(() {
                                    passwordShowkeyboard =
                                        !passwordShowkeyboard;
                                  });
                                },
                                fillColor: Colors.purple[100]),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      cutomElevatedButton(
                          btnColor: const Color.fromARGB(255, 99, 22, 112),
                          btnName: 'Save',
                          btnFunction: formFeildLoginButton),
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
