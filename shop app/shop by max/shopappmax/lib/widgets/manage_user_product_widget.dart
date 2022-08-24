import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappmax/pages/add_and_edit_prodcut.dart';
import 'package:shopappmax/provider/productsprovider.dart';

class MangeUserProductWidget extends StatelessWidget {
  final String title;
  final String productImage;
  final String id;

  MangeUserProductWidget(
      {required this.title, required this.productImage, required this.id});

  @override
  Widget build(BuildContext context) {
    final scafoldMsgr = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(productImage),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AddAndEditProdcutPage.route, arguments: id);
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () async {
                  try {
                    await Provider.of<ProductsProvider>(context, listen: false)
                        .removeProduct(id);
                  } catch (error) {
                    scafoldMsgr.showSnackBar(const SnackBar(
                        content: Text('Item could not be deleted')));
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
