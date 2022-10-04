import 'package:flutter/material.dart';
import 'package:login/model/entities.dart';
import 'package:login/pages/addEdituserpage.dart';
import 'package:login/provider/usercredintial.dart';
import 'package:login/provider/userdetailsprovider.dart';
import 'package:login/widgets/appDrawer.dart';
import 'package:login/widgets/userjobsoverviewwidget.dart';
import 'package:provider/provider.dart';

import '../objectbox.g.dart';

class UserjobsoverviewPage extends StatelessWidget {
  static String route = '/userjobsoverviewPage';

  final Store store;
  UserjobsoverviewPage(this.store);
  @override
  Widget build(BuildContext context) {
    final modalRouteId = ModalRoute.of(context)?.settings.arguments as int;

    final userData = Provider.of<UserCreditials>(context, listen: false)
        .findUserById(store, modalRouteId);
    final userDetaialsData =
        Provider.of<UserDetailsPovider>(context, listen: true).getAll(store);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(UserDetailsPage.route),
              icon: const Icon(Icons.add))
        ],
        title: Text('Hello, ${userData.firstName} ${userData.lastName}'),
      ),
      body: ListView.builder(
        itemCount: userDetaialsData.length,
        itemBuilder: (context, index) => UserJobsOverviewWidget(
          id: userDetaialsData[index].id,
          jobName: userDetaialsData[index].profession,
          yearsOfexperiance: userDetaialsData[index].yearsOfExperiance,
          store: store,
        ),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(
            UserDetailsPage.route,
            arguments: modalRouteId),
        child: const Icon(Icons.add),
      ),
    );
  }
}
