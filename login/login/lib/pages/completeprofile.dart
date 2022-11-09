import 'package:appwrite/appwrite.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/core/res/applicationcons.dart';
import 'package:login/model/completeprofilemodel.dart';
import 'package:login/pages/userProfilepage.dart';
import 'package:login/pages/userjobsoverviewpage.dart';
import 'package:login/provider/completeprofileprovider.dart';
import 'package:login/widgets/appDrawer.dart';
import 'package:login/widgets/dropdownwidget.dart';
import 'package:provider/provider.dart';

class CompleteProfilePage extends StatefulWidget {
  static String route = '/completeProfilePage';

  const CompleteProfilePage({super.key});
  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  String? selectedCity;
  CompleteProfileModel completeProfileSingleData =
      CompleteProfileModel(id: '', city: '', area: '');

  List<String> defaultAreas = [];

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
        // appBar: AppBar(
        //   title: const Text('Complete your profile'),
        // ),
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
                            // textFormFiled(
                            //     textInputAction: TextInputAction.next,
                            //     labelName: 'City',
                            //     keyboardInputType: TextInputType.emailAddress,
                            //     icon: Icons.area_chart,
                            //     saveFunction: (entredValue) {
                            //       completeProfileSingleData =
                            //           CompleteProfileModel(
                            //               id: completeProfileSingleData.id,
                            //               city: entredValue!);
                            //     },
                            //     validationFunction: (entredValue) {
                            //       if (entredValue != null &&
                            //           entredValue.isEmpty) {
                            //         return 'Please enter City';
                            //       }
                            //       return null;
                            //     },
                            //     showICon: false,
                            //     passwordIcon: Icons.remove_red_eye,
                            //     hintText: 'like shafa badran'),
                            // Container(
                            //     padding: const EdgeInsets.all(4),
                            //     margin: const EdgeInsets.symmetric(
                            //         horizontal: 30, vertical: 10),
                            //     child: DropdownSearch<String>(
                            //         items: ApplicationConst.citites,
                            //         onSaved: (entredValue) =>
                            //             completeProfileSingleData =
                            //                 CompleteProfileModel(
                            //                     id: completeProfileSingleData
                            //                         .id,
                            //                     city: entredValue!),
                            //         validator: (entredValue) {
                            //           if (entredValue == null) {
                            //             return 'الرجاء ادخال المدينة';
                            //           }
                            //           return null;
                            //         },
                            //         popupProps: PopupProps.menu(
                            //           constraints: const BoxConstraints(
                            //             maxHeight: 300,
                            //           ),
                            //           menuProps: const MenuProps(
                            //             shadowColor: Colors.pink,
                            //             shape: RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.vertical(
                            //                 bottom: Radius.circular(20),
                            //               ),
                            //             ),
                            //             backgroundColor:
                            //                 Color.fromRGBO(225, 190, 231, 1),
                            //           ),
                            //           listViewProps: const ListViewProps(
                            //               itemExtent: 50,
                            //               padding: EdgeInsets.only(right: 16)),
                            //           itemBuilder:
                            //               (context, item, isSelected) => Column(
                            //             children: [
                            //               const Divider(
                            //                 height: 3,
                            //               ),
                            //               const SizedBox(
                            //                 height: 12,
                            //               ),
                            //               Container(
                            //                 alignment: Alignment.bottomRight,
                            //                 child: Text(
                            //                   item,
                            //                   style: GoogleFonts.lalezar(
                            //                       fontSize: 20),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //           showSelectedItems: true,
                            //           scrollbarProps:
                            //               const ScrollbarProps(thickness: 2),
                            //           showSearchBox: true,
                            //           searchFieldProps: TextFieldProps(
                            //               decoration: InputDecoration(
                            //                   suffixIcon:
                            //                       const Icon(Icons.search),
                            //                   hintTextDirection:
                            //                       TextDirection.rtl,
                            //                   hintText: 'ابحث عن المدينة',
                            //                   hintStyle: GoogleFonts.cairo(
                            //                       fontSize: 18,
                            //                       fontWeight: FontWeight.bold),
                            //                   border: const OutlineInputBorder(
                            //                       borderRadius:
                            //                           BorderRadius.all(
                            //                               Radius.circular(
                            //                                   20))))),
                            //         ),
                            //         dropdownDecoratorProps:
                            //             DropDownDecoratorProps(
                            //           baseStyle: const TextStyle(
                            //             fontSize: 19,
                            //           ),
                            //           dropdownSearchDecoration: InputDecoration(
                            //             label: Text(
                            //               'المدينة',
                            //               style: GoogleFonts.lalezar(
                            //                 fontSize: 20,
                            //               ),
                            //             ),
                            //             filled: true,
                            //             fillColor: const Color.fromRGBO(
                            //                 225, 190, 231, 1),
                            //             enabledBorder: const OutlineInputBorder(
                            //                 borderSide: BorderSide(
                            //                   width: 1,
                            //                 ),
                            //                 borderRadius: BorderRadius.all(
                            //                     Radius.circular(20))),
                            //             prefixIcon: const Icon(
                            //               Icons.location_city,
                            //               color: Colors.black,
                            //             ),
                            //             labelStyle: const TextStyle(
                            //                 color: Colors.black),
                            //             // hintText: 'المدينة',
                            //             // hintStyle:
                            //             //     GoogleFonts.cairo(fontSize: 20),
                            //           ),
                            //         ))),

                            DropDownWidget(
                                items: ApplicationConst.citites,
                                onSaved: (entredValue) =>
                                    completeProfileSingleData =
                                        CompleteProfileModel(
                                            id: completeProfileSingleData.id,
                                            city: entredValue!,
                                            area:
                                                completeProfileSingleData.area),
                                validator: (entredValue) {
                                  if (entredValue == null) {
                                    return 'الرجاء ادخال المدينة';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    if (value == 'عمان') {
                                      defaultAreas =
                                          ApplicationConst.ammanAreas;
                                    }

                                    selectedCity = value;
                                    print(selectedCity);
                                  });
                                },
                                hintText: 'ابحث عن المدينة',
                                label: Text(
                                  'المدينة',
                                  style: GoogleFonts.lalezar(
                                    fontSize: 20,
                                  ),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Visibility(
                              visible: selectedCity == 'عمان' ? true : false,
                              child: DropDownWidget(
                                  items: defaultAreas,
                                  onSaved: (entredValue) =>
                                      completeProfileSingleData =
                                          CompleteProfileModel(
                                              id: completeProfileSingleData.id,
                                              city: completeProfileSingleData
                                                  .city,
                                              area: entredValue!),
                                  validator: (entredValue) {
                                    if (entredValue == null &&
                                        selectedCity == 'عمان') {
                                      return 'الرجاء ادخال المنطقة';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      print(selectedCity);
                                      print(value);
                                    });
                                  },
                                  hintText: 'ابحث عن المنطقة',
                                  label: Text(
                                    'المنطقة',
                                    style: GoogleFonts.lalezar(
                                      fontSize: 20,
                                    ),
                                  )),
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
