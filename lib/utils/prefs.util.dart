import 'package:get_storage/get_storage.dart';

enum PrefKey {
  accesToken,
  userID,
  enrollmentID,
  enrollmentStatus,
}

String? get getAppToken => GetStorage().read<String>(PrefKey.accesToken.name);
String? get getUserID => GetStorage().read<String>(PrefKey.userID.name);
String? get getUserEnrollmentID => GetStorage().read<String>(PrefKey.enrollmentID.name);
String? get getUserEnrollmentStatus => GetStorage().read<String>(PrefKey.enrollmentStatus.name);
