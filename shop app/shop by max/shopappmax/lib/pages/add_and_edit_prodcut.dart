import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/provider/product.dart';
import 'package:shopappmax/provider/productsprovider.dart';

class AddAndEditProdcutPage extends StatefulWidget {
  static String route = '/add_edit_prodcut_page';

  @override
  State<AddAndEditProdcutPage> createState() => _AddAndEditProdcutPageState();
}

class _AddAndEditProdcutPageState extends State<AddAndEditProdcutPage> {
  final imageUrlController = TextEditingController();
  final imageFocuesPointer = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var initDate = true;
  var _editiedProdcut =
      Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  var initialProdcutDate = {
    'title': '',
    'price': '',
    'description': '',
    'imageUrl': ''
  };

  var _isLoading = false;

  @override
  void initState() {
    imageFocuesPointer.addListener(getImageFocus);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (initDate) {
      final productId = ModalRoute.of(context)!.settings.arguments as String?;
      if (productId != null && productId != '') {
        _editiedProdcut =
            Provider.of<ProductsProvider>(context).findById(productId);

        initialProdcutDate = {
          'title': _editiedProdcut.title,
          'price': _editiedProdcut.price.toString(),
          'description': _editiedProdcut.description,
          'imageUrl': ''
        };
        imageUrlController.text = _editiedProdcut.imageUrl;
      }
    }
    // we use didChangeDependencies because we cant call ModalRoute in  init state.
    print('did change');
    initDate = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //we dispose the below to prevent memory leikage
    imageUrlController.dispose();
    imageFocuesPointer.removeListener(getImageFocus);

    super.dispose();
  }

  void getImageFocus() {
    if ((!imageUrlController.text.startsWith('http://')) &&
        (!imageUrlController.text.startsWith('https://'))) {
      return;
    } else if (!imageFocuesPointer.hasFocus) setState(() {});
  }

  Future<void> saveForm() async {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();

    setState(() {
      _isLoading = true;
    });
    try {
      if (_editiedProdcut.id != null && _editiedProdcut.id != '') {
        await Provider.of<ProductsProvider>(context, listen: false)
            .updateProduct(_editiedProdcut.id, _editiedProdcut);

        //  print(_editiedProdcut.id);
      }
      if (_editiedProdcut.id == '') {
        // here will be wait the user while adding the dta
        await Provider.of<ProductsProvider>(context, listen: false)
            .addProduct(_editiedProdcut);
      }
    } catch (error) {
      // show dialog is a future and will wait hte user to click on ok
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Attention'),
                content: const Text('An error occured'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ok'))
                ],
              ));
    }

    // finally {
    //   // finnaly will be appllied after catch and if there an error , so that we use it to pop up and get to the item page
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Navigator.of(context).pop();
    // }
    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add and edit product'),
        actions: [
          IconButton(onPressed: saveForm, icon: const Icon(Icons.save))
        ],
      ),
      body: _isLoading
          ? Center(child: const CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: initialProdcutDate['title'],
                        decoration: const InputDecoration(labelText: 'Title'),
                        textInputAction: TextInputAction.next,
                        onSaved: (newValue) {
                          _editiedProdcut = Product(
                            title: newValue!,
                            description: _editiedProdcut.description,
                            price: _editiedProdcut.price,
                            imageUrl: _editiedProdcut.imageUrl,
                            id: _editiedProdcut.id,
                            isFavoirite: _editiedProdcut.isFavoirite,
                          );
                        },
                        validator: (enetredValue) {
                          if (enetredValue != null && enetredValue.isEmpty) {
                            return 'Please enter a title';
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: initialProdcutDate['price'],
                        decoration: const InputDecoration(labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) {
                          _editiedProdcut = Product(
                            title: _editiedProdcut.title,
                            description: _editiedProdcut.description,
                            price: double.parse(newValue!),
                            imageUrl: _editiedProdcut.imageUrl,
                            id: _editiedProdcut.id,
                            isFavoirite: _editiedProdcut.isFavoirite,
                          );
                        },
                        validator: (enetredValue) {
                          if (enetredValue != null && enetredValue.isEmpty) {
                            return 'Please enter a price';
                          }
                          //try parse is diffrent than parse , in tryparse if not a number it through null , will parse through an error
                          if (double.tryParse(enetredValue!) == null) {
                            return 'Please enter a valid number';
                          }

                          if (double.tryParse(enetredValue)! <= 0) {
                            return 'Please enter a number more than zero';
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: initialProdcutDate['description'],
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onSaved: (newValue) {
                          _editiedProdcut = Product(
                            title: _editiedProdcut.title,
                            description: newValue!,
                            price: _editiedProdcut.price,
                            imageUrl: _editiedProdcut.imageUrl,
                            id: _editiedProdcut.id,
                            isFavoirite: _editiedProdcut.isFavoirite,
                          );
                        },
                        validator: (enetredValue) {
                          if (enetredValue != null && enetredValue.isEmpty) {
                            return 'Please enter a description';
                          }
                          if ((enetredValue?.length)! <= 5) {
                            return 'Description shall be more than 5 charahter';
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 25),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: Container(
                              child: imageUrlController.text.isEmpty
                                  ? const Text('Enter url')
                                  : FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(
                                          imageUrlController.text),
                                    ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              //we will no initial data as we will use it in controller , wither controller or initial could be used not both
                              decoration:
                                  const InputDecoration(labelText: 'Image Url'),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.url,
                              controller: imageUrlController,
                              focusNode: imageFocuesPointer,
                              onSaved: (newValue) {
                                _editiedProdcut = Product(
                                  title: _editiedProdcut.title,
                                  description: _editiedProdcut.description,
                                  price: _editiedProdcut.price,
                                  imageUrl: newValue!,
                                  id: _editiedProdcut.id,
                                  isFavoirite: _editiedProdcut.isFavoirite,
                                );
                              },
                              validator: (enetredValue) {
                                if (enetredValue != null &&
                                    enetredValue.isEmpty) {
                                  return 'Please enter a image url';
                                }
                                if (enetredValue != null &&
                                    !(enetredValue.startsWith('http://')) &&
                                    !(enetredValue.startsWith('https://'))) {
                                  return 'please enter a valid URL.';
                                }
                              },
                              onFieldSubmitted: (_) => saveForm(),
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
