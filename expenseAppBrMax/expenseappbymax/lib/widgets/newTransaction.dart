import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final textTitleControllrt = TextEditingController();
  final textAmountController = TextEditingController();

  final Function newTX;

  NewTransaction(this.newTX);

  void addNewTransaction() {
    final enteredTitle = textTitleControllrt.text;
    final entredAmount = double.parse(textAmountController.text);

    if (enteredTitle.isEmpty && entredAmount <= 0) {
      return;
    } else {
      newTX(enteredTitle, entredAmount);
    }
  }

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
              onSubmitted: (_) => addNewTransaction(),
              decoration: const InputDecoration(label: Text('Title')),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addNewTransaction(),
              controller: textAmountController,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
            ),
            TextButton(
                onPressed: addNewTransaction,
                child: const Text('Add'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blue)))
          ],
        ),
      ),
    );
  }
}
