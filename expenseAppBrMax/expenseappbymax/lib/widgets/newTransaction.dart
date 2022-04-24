import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTX;

  NewTransaction(this.newTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textTitleControllrt = TextEditingController();

  final textAmountController = TextEditingController();

  void addNewTransaction() {
    final enteredTitle = textTitleControllrt.text;
    final entredAmount = double.parse(textAmountController.text);

    if (enteredTitle.isEmpty && entredAmount <= 0) {
      return;
    } else {
      widget.newTX(enteredTitle, entredAmount);
    }
    Navigator.of(context).pop();
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
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)))
          ],
        ),
      ),
    );
  }
}