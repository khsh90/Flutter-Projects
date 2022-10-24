import 'package:appwrite/appwrite.dart';

class ApplicationConst {
  static const String projectId = '63391dff87fa8788023c';
  // static const String apiEndpoint = 'http://192.168.1.102:2025/v1';
  static const String apiEndpoint = 'http://46.185.128.40:2025/v1';
  static Client client = Client();

  static const databaseId = '633a812040fe583bce0a';
  static const jobCollectionId = '633a8134751799d382e5';
  static const userProfileCollectionId = '6353a266b0530babaa88';
  static late Account account;
  static late Databases database;
  static void init() {
    client = Client()
        .setEndpoint(apiEndpoint) // Your Appwrite Endpoint
        .setProject(projectId) // Your project ID
        .setSelfSigned(status: true);

    account = Account(client);
    database = Databases(client);
  }
}
