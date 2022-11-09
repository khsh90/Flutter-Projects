import 'package:appwrite/appwrite.dart';

class ApplicationConst {
  static List<String> citites = const [
    'عمان',
    'الزرقاء',
    'إربد',
    'الرصيفة',
    'سحاب',
    'الرمثا',
    'العقبة',
    'المفرق',
    'مأدبا',
    'السلط',
    'الجيزة',
    'عين الباشا',
    'ايدون',
    'الضليل',
    'جرش',
    'الصريح',
    'الهاشمية',
    'معان',
    'بيت راس',
    'الحصن',
    'الطرة',
    'ناعور',
    'الكرك',
    'كفرنجة',
    'دير ابي سعيد',
    'النعيمة',
    'الشجرة',
    'الطفيلة',
    'مؤتة',
    'غور الصافي',
    'عنجرة',
    'المشارع',
    'حواره',
    'كفر يوبا',
    'كريمة',
    'الطيبة',
    'المزار الشمالي',
    'السخنة',
    'الخالدية الجديدة',
    'بشرى',
    'ام السماق الجنوبي',
    'جديتا',
    'الفحيص',
    'المزار الجنوبي',
    'شونة الشمالية',
    'كفر الماء',
    'ماحص',
  ];

  static List<String> ammanAreas = [
    'العبدلي',
    'المدينة الرياضية',
    'أبو نصير',
    'النصر',
    'القويسمة',
    'الجويدة',
    'أبو علندا',
    'الرقيم',
    'اليرموك',
    'جبل النزهة',
    'الجيزة',
    'الموقر',
    'المقابلين',
    'بدر',
    'بدر الجديدة',
    'بسمان',
    'حسبان',
    'الجبيهة',
    'خريبة السوق',
    'مرج الحمام',
    'ماركا',
    'المدينة',
    'ناعور',
    'أحد',
    'راس العين',
    'جبل الجوفة',
    'جبل الأشرفية',
    'سحاب',
    'شفا بدران',
    'صويلح',
    'ضاحية الأمير حسن',
    'طبربور',
    'طارق',
    'تلاع العلي',
    'أم السماق',
    'خلدا',
    'وادي السير',
    'زهران',
    'ضاحية الياسمين',
    'حي نزال',
  ];

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
