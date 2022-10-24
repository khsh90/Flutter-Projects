import 'package:flutter/material.dart';
import 'package:login/pages/completeprofile.dart';
import 'package:login/pages/userdetailspage.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/userProfilepage.dart';
import 'package:login/provider/authstate.dart';
import 'package:login/provider/completeprofileprovider.dart';
import 'package:login/provider/databasestateprovider.dart';
import 'package:login/widgets/appdrawer.dart';
import 'package:login/widgets/userjobsoverviewwidget.dart';
import 'package:provider/provider.dart';

class UserjobsoverviewPage extends StatefulWidget {
  static String route = '/userjobsoverviewPage';

  const UserjobsoverviewPage({super.key});

  @override
  State<UserjobsoverviewPage> createState() => _UserjobsoverviewPageState();
}

class _UserjobsoverviewPageState extends State<UserjobsoverviewPage> {
  @override
  Future<void> didChangeDependencies() async {
    await Provider.of<CompleteProfileProvider>(context, listen: false)
        .getListOfDocument();

    final xx = Provider.of<CompleteProfileProvider>(context, listen: false)
        .completeprofileData;

    if (xx.isEmpty) {
      Navigator.of(context).pushReplacementNamed(CompleteProfilePage.route);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User professions'),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(UserProfilePage.route),
                  icon: const Icon(Icons.person)),
              IconButton(
                  onPressed: () {
                    Provider.of<AuthStateProvider>(context, listen: false)
                        .logout()
                        .then((_) => Navigator.of(context)
                            .pushReplacementNamed(SigninPage.route));
                  },
                  icon: const Icon(Icons.exit_to_app)),
            ],
          )
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<DatabaseStateProvider>(context, listen: false)
              .getListOfDocument(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error occured'),
                );
              } else {
                return Consumer<DatabaseStateProvider>(
                  builder: (context, value, _) => ListView.builder(
                    itemCount: value.userPofessionModel.length,
                    itemBuilder: (context, index) => UserJobsOverviewWidget(
                        id: value.userPofessionModel[index].documentId,
                        jobName: value.userPofessionModel[index].userProfession,
                        yearsOfexperiance:
                            value.userPofessionModel[index].yearsOfExperiance),
                  ),
                );
              }
            }
          }),
      //  drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          UserDetailsPage.route,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
