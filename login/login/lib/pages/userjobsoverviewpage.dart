import 'package:flutter/material.dart';
import 'package:login/pages/addEdituserpage.dart';
import 'package:login/widgets/appDrawer.dart';

class UserjobsoverviewPage extends StatelessWidget {
  static String route = '/userjobsoverviewPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(UserDetailsPage.route),
              icon: const Icon(Icons.add))
        ],
        title: const Text('Hello,'),
      ),
      body: const Center(),
      //  ListView.builder(
      //   itemCount: userDetaialsData.length,
      //   itemBuilder: (context, index) => UserJobsOverviewWidget(
      //     id: userDetaialsData[index].id,
      //     jobName: userDetaialsData[index].profession,
      //     yearsOfexperiance: userDetaialsData[index].yearsOfExperiance,
      //     store: store,
      //   ),
      // ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(
          UserDetailsPage.route,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
