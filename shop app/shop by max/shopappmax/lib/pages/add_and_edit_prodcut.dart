import 'package:flutter/material.dart';

class AddAndEditProdcutPage extends StatefulWidget {
  static String route = '/add_edit_prodcut_page';

  @override
  State<AddAndEditProdcutPage> createState() => _AddAndEditProdcutPageState();
}

class _AddAndEditProdcutPageState extends State<AddAndEditProdcutPage> {
  final imageUrlController = TextEditingController();
  final imageFocuesPointer = FocusNode();

  @override
  void initState() {
    imageFocuesPointer.addListener(getImageFocus);
  }

  @override
  void dispose() {
    //we dispose the below to prevent memory leikage
    imageUrlController.dispose();
    imageFocuesPointer.removeListener(getImageFocus);
  }

  void getImageFocus() {
    if (!imageFocuesPointer.hasFocus) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add and edit product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10, top: 25),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Container(
                    child: imageUrlController.text.isEmpty
                        ? const Text('Enter url')
                        : FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(imageUrlController.text),
                          ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Image Url'),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.url,
                    controller: imageUrlController,
                    focusNode: imageFocuesPointer,
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
