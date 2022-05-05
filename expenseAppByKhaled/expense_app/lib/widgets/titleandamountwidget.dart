import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class TitleAndAmountWidget extends StatefulWidget {
  @override
  State<TitleAndAmountWidget> createState() => _TitleAndAmountWidget();
}

class _TitleAndAmountWidget extends State<TitleAndAmountWidget> {
  var titleConroller = TextEditingController();
  var amountConroller = TextEditingController();

  void enteredAmountAndTitle() {
    var title = titleConroller.text;
    double amount = double.parse(amountConroller.text);

    print(title);
    print(amount);
  }

  var dateTimePicker = DateTimePicker(
    initialDate: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: titleConroller,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
          ),
          const SizedBox(
            height: 22,
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
                  const Text(
                    'Pick Date : No date choosen',
                    style: TextStyle(fontFamily: 'Acme', fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {},
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
                onPressed: enteredAmountAndTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
