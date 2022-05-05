import 'package:expense_app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

class TitleAndAmountWidget extends StatefulWidget {
  @override
  State<TitleAndAmountWidget> createState() => _TitleAndAmountWidget();

  final Function addTransaction;

  TitleAndAmountWidget(this.addTransaction);
}

class _TitleAndAmountWidget extends State<TitleAndAmountWidget> {
  var titleConroller = TextEditingController();
  var amountConroller = TextEditingController();
  var _pickedDateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            controller: titleConroller,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            controller: amountConroller,
            decoration: const InputDecoration(hintText: 'Enter Amount'),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pick Date : ${_pickedDateTime == null ? 'No date choosen' : DateFormat.yMMMd().format(_pickedDateTime)}",
                    style: const TextStyle(
                        fontFamily: 'Acme', fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () => showDatePicker(
                            builder: (context, child) => Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                      primary: Theme.of(context).primaryColor)),
                              child: child!,
                            ),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2023),
                          ).then((date) {
                            setState(() {
                              _pickedDateTime = date;
                            });
                          }),
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: const Text(
                  'Add',
                  style: TextStyle(fontFamily: 'Acme', fontSize: 16),
                ),
                onPressed: () => widget.addTransaction(
                    titleConroller.text, double.parse(amountConroller.text),_pickedDateTime),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
