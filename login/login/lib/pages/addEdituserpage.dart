import 'package:flutter/material.dart';
import 'package:login/provider/userdetailsprovider.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({Key? key}) : super(key: key);
  static String route = '/UserDetailsPage';

  final _formKey = GlobalKey<FormState>();
  Widget textFormFiled({
    required String labelName,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
    // required FocusNode focusNode,
    bool secureKeyboard = false,
    required IconData passwordIcon,
    bool showICon = true,
    void Function()? showPasswordIconButtonFunction,
    int maxLineLength = 1,
    TextInputType? keyboardInputType,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
          //   focusNode: focusNode,
          keyboardType: keyboardInputType,
          maxLines: maxLineLength,
          obscureText: secureKeyboard,
          decoration: InputDecoration(
              suffixIcon: Visibility(
                  visible: showICon,
                  child: IconButton(
                      onPressed: showPasswordIconButtonFunction,
                      icon: Icon(passwordIcon))),
              prefixIcon: Icon(icon, color: Colors.black),
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

  var formFieldValues = UserDetailsPovider(
      // fullName: '',
      country: '',
      city: '',
      profession: '',
      yearsOfExperiance: '');

  void formFeildLoginButton() {
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
    print(formFieldValues);
    // print(formFieldValues.fullName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User details'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: const Text(
                'User details page',
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // textFormFiled(
                  //     labelName: 'Full name',
                  //     icon: Icons.person,
                  //     saveFunction: (entredValue) => {
                  //           formFieldValues = UserDetailsPovider(
                  //               id: formFieldValues.id,
                  //             //  fullName: entredValue!,
                  //               country: formFieldValues.country,
                  //               city: formFieldValues.city,
                  //               mobilePhone: formFieldValues.mobilePhone,
                  //               profession: formFieldValues.profession,
                  //               professionDetails:
                  //                   formFieldValues.professionDetails)
                  //         },
                  //     validationFunction: (entredValue) {
                  //       if (entredValue != null && entredValue.isEmpty) {
                  //         return 'Please enter a user name';
                  //       }
                  //       return null;
                  //     },
                  //     //   focusNode: userNameFocusNode,
                  //     showICon: false,
                  //     passwordIcon: Icons.remove_red_eye),
                  textFormFiled(
                      labelName: 'Country',
                      icon: Icons.person,
                      saveFunction: (entredValue) => {
                            formFieldValues = UserDetailsPovider(
                                id: formFieldValues.id,
                                //  fullName: formFieldValues.fullName,
                                country: entredValue!,
                                city: formFieldValues.city,
                                profession: formFieldValues.profession,
                                yearsOfExperiance:
                                    formFieldValues.yearsOfExperiance)
                          },
                      validationFunction: (entredValue) {
                        if (entredValue != null && entredValue.isEmpty) {
                          return 'Please enter the country';
                        }
                        return null;
                      },
                      //   focusNode: userNameFocusNode,
                      showICon: false,
                      passwordIcon: Icons.remove_red_eye),
                  textFormFiled(
                      labelName: 'City',
                      icon: Icons.location_city,
                      saveFunction: (entredValue) => {
                            formFieldValues = UserDetailsPovider(
                                id: formFieldValues.id,
                                //  fullName: formFieldValues.fullName,
                                country: formFieldValues.country,
                                city: entredValue!,
                                profession: formFieldValues.profession,
                                yearsOfExperiance:
                                    formFieldValues.yearsOfExperiance)
                          },
                      validationFunction: (entredValue) {
                        if (entredValue != null && entredValue.isEmpty) {
                          return 'Please enter the city';
                        }
                        return null;
                      },
                      //   focusNode: userNameFocusNode,
                      showICon: false,
                      passwordIcon: Icons.remove_red_eye),

                  textFormFiled(
                      labelName: 'profession',
                      icon: Icons.precision_manufacturing_outlined,
                      saveFunction: (entredValue) => {
                            formFieldValues = UserDetailsPovider(
                                id: formFieldValues.id,
                                //   fullName: formFieldValues.fullName,
                                country: formFieldValues.country,
                                city: formFieldValues.city,
                                profession: entredValue!,
                                yearsOfExperiance:
                                    formFieldValues.yearsOfExperiance)
                          },
                      validationFunction: (entredValue) {
                        if (entredValue != null && entredValue.isEmpty) {
                          return 'Please enter the profession';
                        }
                        return null;
                      },
                      //   focusNode: userNameFocusNode,
                      showICon: false,
                      passwordIcon: Icons.remove_red_eye),
                  textFormFiled(
                      labelName: 'Years of experiance',
                      icon: Icons.person,
                      saveFunction: (entredValue) => {
                            formFieldValues = UserDetailsPovider(
                                id: formFieldValues.id,
                                // fullName: formFieldValues.fullName,
                                country: formFieldValues.country,
                                city: formFieldValues.city,
                                profession: formFieldValues.profession,
                                yearsOfExperiance: entredValue!)
                          },
                      validationFunction: (entredValue) {
                        if (entredValue != null && entredValue.isEmpty) {
                          return 'Please enter the years of experiance';
                        }
                        if ((entredValue?.length)! <= 1 ) {
                          return 'more than two digits';
                        }
                        return null;
                      },
                      //   focusNode: userNameFocusNode,
                      showICon: false,
                      passwordIcon: Icons.remove_red_eye,
                      maxLineLength: 1,
                      keyboardInputType: TextInputType.phone),
                  const SizedBox(
                    height: 25,
                  ),
                  cutomElevatedButton(
                      btnColor: const Color.fromARGB(255, 99, 22, 112),
                      btnName: 'Save',
                      btnFunction: formFeildLoginButton),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
