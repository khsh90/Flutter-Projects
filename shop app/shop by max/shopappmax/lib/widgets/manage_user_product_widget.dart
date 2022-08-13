import 'package:flutter/material.dart';

class MangeUserProductWidget extends StatelessWidget {
  final String title;
  final String productImage;

  MangeUserProductWidget({required this.title, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(productImage),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {},
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
