import 'package:appwrite/appwrite.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/model/completeprofilemodel.dart';
import 'package:login/pages/userProfilepage.dart';
import 'package:login/pages/userjobsoverviewpage.dart';
import 'package:login/provider/completeprofileprovider.dart';
import 'package:login/widgets/appDrawer.dart';
import 'package:provider/provider.dart';

class CompleteProfilePage extends StatefulWidget {
  static String route = '/completeProfilePage';

  const CompleteProfilePage({super.key});
  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  CompleteProfileModel completeProfileSingleData =
      CompleteProfileModel(id: '', city: '');

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
      child: Text(btnName),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> formFeildLoginButton() async {
    final valid = _formKey.currentState?.validate();

    if (!valid!) {
      return;
    }
    _formKey.currentState?.save();
    try {
      await Provider.of<CompleteProfileProvider>(context, listen: false)
          .createDocumentProfile(
              completeProfileModel: completeProfileSingleData);
      print(completeProfileSingleData.id);
      Navigator.of(context).pushReplacementNamed(UserjobsoverviewPage.route);
    } on AppwriteException catch (e) {
      showAlertMsg('${e.message}');
    } catch (e) {
      showAlertMsg('$e');
    }
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Complete your profile'),
        ),
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
                        'Complete your profile',
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
                                textInputAction: TextInputAction.next,
                                labelName: 'City',
                                keyboardInputType: TextInputType.emailAddress,
                                icon: Icons.area_chart,
                                saveFunction: (entredValue) {
                                  completeProfileSingleData =
                                      CompleteProfileModel(
                                          id: completeProfileSingleData.id,
                                          city: entredValue!);
                                },
                                validationFunction: (entredValue) {
                                  if (entredValue != null &&
                                      entredValue.isEmpty) {
                                    return 'Please enter City';
                                  }
                                  return null;
                                },
                                showICon: false,
                                passwordIcon: Icons.remove_red_eye,
                                hintText: 'like shafa badran'),
                            Container(
                              padding: EdgeInsets.all(4),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              // decoration: BoxDecoration(
                              //   color: Colors.purple[100],
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(style: BorderStyle.solid),
                              // ),
                              child: DropdownSearch<String>(
                                items: const [
                                  'Amman',
                                  'Madaba',
                                  'Karak',
                                  'Ajloun',
                                ],
                                onSaved: (newValue) => print(newValue),
                                popupProps: const PopupPropsMultiSelection.menu(
                                    showSearchBox: true),
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      prefixIcon: Icon(Icons.location_city),
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      hintText: 'Select areas',
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      cutomElevatedButton(
                          btnColor: const Color.fromARGB(255, 99, 22, 112),
                          btnName: 'Complete your profile',
                          btnFunction: formFeildLoginButton),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //   drawer: const AppDrawer(),
      ),
    );
  }
}
