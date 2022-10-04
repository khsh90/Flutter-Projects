import 'package:flutter/material.dart';
import 'package:login/provider/userdetailsprovider.dart';
import 'package:provider/provider.dart';

import '../objectbox.g.dart';

class UserJobsOverviewWidget extends StatelessWidget {
  final int id;
  final String jobName;
  final int yearsOfexperiance;
  final Store store;
  // final String customerFirstName;
  // final String customerLastName;

  UserJobsOverviewWidget({
    required this.id,
    required this.jobName,
    required this.yearsOfexperiance,
    // required this.customerFirstName,
    // required this.customerLastName,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        child: ListTile(
          onTap: () {
            //todo:user experiace detais page
          },
          title: Text('job:$jobName'),
          subtitle: Text("$yearsOfexperiance"),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width - 255,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      Provider.of<UserDetailsPovider>(context, listen: false)
                          .deleteUSerJob(store, id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
