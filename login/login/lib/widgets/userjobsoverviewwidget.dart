import 'package:flutter/material.dart';
import 'package:login/pages/editprofession.dart';
import 'package:login/pages/userdetailspage.dart';
import 'package:login/provider/databasestateprovider.dart';
import 'package:provider/provider.dart';

//import '../objectbox.g.dart';

class UserJobsOverviewWidget extends StatelessWidget {
  final String id;
  final String jobName;
  final int yearsOfexperiance;

  const UserJobsOverviewWidget({
    super.key,
    required this.id,
    required this.jobName,
    required this.yearsOfexperiance,
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
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(EditProfession.route, arguments: id);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () async {
                      await Provider.of<DatabaseStateProvider>(context,
                              listen: false)
                          .deleteDocument(id: id);
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
