import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWidget extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
    final void Function(String?)? onChanged;

  final Widget? label;
  final String? hintText;

  DropDownWidget(
      {required this.items,
      required this.onSaved,
      required this.validator,
      required  this.onChanged,
      required this.hintText,
      required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: DropdownSearch<String>(
            items: items,
            onSaved: onSaved,
            validator: validator,
            onChanged:onChanged,
            popupProps: PopupProps.menu(
              constraints: const BoxConstraints(
                maxHeight: 300,
              ),
              menuProps: const MenuProps(
                shadowColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                backgroundColor: Color.fromRGBO(225, 190, 231, 1),
              ),
              listViewProps: const ListViewProps(
                  itemExtent: 50, padding: EdgeInsets.only(right: 16)),
              itemBuilder: (context, item, isSelected) => Column(
                children: [
                  const Divider(
                    height: 3,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      item,
                      style: GoogleFonts.lalezar(fontSize: 20),
                    ),
                  ),
                ],
              ),
              showSelectedItems: true,
              scrollbarProps: const ScrollbarProps(thickness: 2),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintTextDirection: TextDirection.rtl,
                      hintText: hintText,
                      hintStyle: GoogleFonts.cairo(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))))),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: const TextStyle(
                fontSize: 19,
              ),
              dropdownSearchDecoration: InputDecoration(
                label: label,
                filled: true,
                fillColor: const Color.fromRGBO(225, 190, 231, 1),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefixIcon: const Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
                labelStyle: const TextStyle(color: Colors.black),
              ),
            )));
  }
}
