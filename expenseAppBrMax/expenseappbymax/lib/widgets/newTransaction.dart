import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final textTitleControllrt = TextEditingController();
  final textAmountController = TextEditingController();

  final Function newTX;

  NewTransaction(this.newTX);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: textTitleControllrt,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            TextField(
              controller: textAmountController,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
            ),
            TextButton(
                onPressed: () {
                  return newTX(textTitleControllrt.text,
                      double.parse(textAmountController.text));
                },
                child: const Text('Add'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blue)))
          ],
        ),
      ),
    );
  }
}
