import 'package:flutter/material.dart';
import 'package:login/model/userProfessionmodel.dart';
import 'package:login/pages/userjobsoverviewpage.dart';
import 'package:login/provider/databasestateprovider.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatefulWidget {
  static String route = '/UserDetailsPage';

  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  UserProfessionModel formFieldValues = UserProfessionModel(
      documentId: '', userProfession: '', yearsOfExperiance: 0);

  Map<String, String> initData = {'profession': '', 'yearsOfExperiance': ''};

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    final documentId =
        ModalRoute.of(context)?.settings.arguments.toString() ?? ' ';

    print(documentId);
    //print(formFieldValues.documentId);

    if (documentId == null) {
      formFieldValues =
          Provider.of<DatabaseStateProvider>(context).findById(documentId);

      initData = {
        '\$id': formFieldValues.documentId,
        'profession': formFieldValues.userProfession,
        'yearsOfExperiance': formFieldValues.yearsOfExperiance.toString()
      };
    } else {}

    super.didChangeDependencies();
  }

  Widget textFormFiled({
    String? initialValue,
    required String labelName,
    required IconData icon,
    required void Function(String?)? saveFunction,
    required String? Function(String?)? validationFunction,
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
          initialValue: initialValue,
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
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 3,
      ),
      child: Text(btnName),
    );
  }

  void formFeildLoginButton() {
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();

    if (formFieldValues.documentId.isEmpty) {
      Provider.of<DatabaseStateProvider>(context, listen: false)
          .createDocument(userProfessionModel: formFieldValues)
          .then((_) => Navigator.of(context)
              .pushReplacementNamed(UserjobsoverviewPage.route));

      print('document created');
    }
    if (formFieldValues.documentId.isNotEmpty) {
      Provider.of<DatabaseStateProvider>(context, listen: false)
          .updateItem(formFieldValues.documentId, formFieldValues)
          .then((_) => Navigator.of(context)
              .pushReplacementNamed(UserjobsoverviewPage.route));

      print('document updated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Job details '),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: const Text(
                'Job details',
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
                  textFormFiled(
                      initialValue: initData['profession'],
                      labelName: 'profession',
                      icon: Icons.precision_manufacturing_outlined,
                      saveFunction: (entredValue) => {
                            formFieldValues = UserProfessionModel(
                                documentId: formFieldValues.documentId,
                                userProfession: entredValue!,
                                yearsOfExperiance:
                                    formFieldValues.yearsOfExperiance)
                          },
                      validationFunction: (entredValue) {
                        if (entredValue != null && entredValue.isEmpty) {
                          return 'Please enter the profession';
                        }
                        return null;
                      },
                      showICon: false,
                      passwordIcon: Icons.remove_red_eye),
                  textFormFiled(
                      initialValue: initData['yearsOfExperiance'],
                      labelName: 'Years of experiance',
                      icon: Icons.work,
                      saveFunction: (entredValue) => {
                            formFieldValues = UserProfessionModel(
                                documentId: formFieldValues.documentId,
                                userProfession: formFieldValues.userProfession,
                                yearsOfExperiance: int.tryParse(entredValue!)!)
                          },
                      validationFunction: (entredValue) {
                        if (entredValue != null && entredValue.isEmpty) {
                          return 'Please enter the years of experiance';
                        }
                        if ((int.tryParse(entredValue!)) == null) {
                          return 'numbers only allowed';
                        }
                        if ((int.tryParse(entredValue))! <= 0) {
                          return 'Years of expericance shall be more than zero';
                        }
                        if ((entredValue.length) > 2) {
                          return 'more than two digit';
                        }
                        if ((int.tryParse(entredValue))! > 40) {
                          return 'The maximum years of expreiacnce is 40 years';
                        }

                        return null;
                      },
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
