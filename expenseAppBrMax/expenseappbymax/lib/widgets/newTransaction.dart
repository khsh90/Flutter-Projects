import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTX;

  NewTransaction(this.newTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textTitleControllrt = TextEditingController();

  final textAmountController = TextEditingController();

  var selectedDate;

  void addNewTransaction() {
    final enteredTitle = textTitleControllrt.text;
    final entredAmount = double.parse(textAmountController.text);

    if (enteredTitle.isEmpty && entredAmount <= 1 && selectedDate == null) {
      return;
    } else {
      widget.newTX(enteredTitle, entredAmount, selectedDate);
    }
    Navigator.of(context).pop();
  }

  void pickedDateForNewTx() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50),
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
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Picked Date: ${selectedDate == null ? 'No date choosen' : DateFormat.yMd().format(selectedDate)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: pickedDateForNewTx,
                      child: const Text(
                        'Select a date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              ElevatedButton(
                  onPressed: addNewTransaction,
                  child: const Text('Add'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)))
            ],
          ),
        ),
      ),
    );
  }
}
