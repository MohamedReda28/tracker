import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as perm_handler;

import '../errors/premission_error.dart';

class LocationServece {
  final Location location;

  LocationServece({required this.location});

  Future<void> checkAndRequestLocationService() async {
    // 1. التحقق مما إذا كانت خدمة الموقع مفعّلة
    var isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      // 2. إذا كانت الخدمة غير مفعّلة، نطلب تفعيلها
      isServiceEnabled = await location.requestService();

      // 3. التحقق مما إذا نجح التفعيل أم لا
      if (!isServiceEnabled) {
        await perm_handler.openAppSettings();
        throw CheckAndRequestLocationServiceException(
            message: 'you have to oppen location to used');
      }
    }

    // 5. نعيد القيمة الحالية لحالة الخدمة (true أو false)
  }

  // دالة احترافية لطلب إذن الموقع مع معالجة جميع الحالات
  Future<void> checkAndRequestPermissionLocation() async {
    // 1. التحقق من الحالة الحالية للإذن
    var permissionStatus = await location.hasPermission();

    // 2. إذا كان مرفوضًا (ولم يكن مرفوض للأبد)
    if (permissionStatus == PermissionStatus.denied) {
      // نطلب الإذن من المستخدم
      permissionStatus = await location.requestPermission();

      // 3. نتحقق من نتيجة الطلب
      if (permissionStatus == PermissionStatus.granted) {
        // إذًا تم منح الإذن
      } else if (permissionStatus == PermissionStatus.denied) {
        // تم الرفض مرة أخرى (وليس للأبد)، يمكننا عرض رسالة بسيطة
        throw CheckAndRequestPermissionLocationException(
            message: 'you have to given Permission');
      } else if (permissionStatus == PermissionStatus.deniedForever) {
        // تم الرفض للأبد، نعرض رسالة ونوجه لصفحة الإعدادات
        // نفتح إعدادات التطبيق مباشرة
        await perm_handler.openAppSettings();
        throw CheckAndRequestPermissionLocationException(
            message: 'you have to given Permission');
        // لأن الإذن لم يُمنح
      }
    } else if (permissionStatus == PermissionStatus.granted) {
      // إذن كان ممنوح من قبل
    } else if (permissionStatus == PermissionStatus.deniedForever) {
      // الحالة التي تم فيها الرفض للأبد من قبل (ولم يتم طلب الإذن الآن)
      await perm_handler.openAppSettings();
      throw CheckAndRequestPermissionLocationException(message: 'open permission');
    }
  }

// لو عايز اجيب Stream للموقع
  void getRealTimeLocationData(void Function(LocationData)? onData) async {
    //لازم تستدي الاتنين ميثود بتوع الاذن عشان متكنش مضطلر تسستدعي كل واحده لوحدها
    await checkAndRequestLocationService();
    await checkAndRequestPermissionLocation();
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }

  // لو عايز اجيب الموقع
  Future<LocationData> getLocation() async {
    //لازم تستدي الاتنين ميثود بتوع الاذن عشان متكنش مضطلر تسستدعي كل واحده لوحدها
    await checkAndRequestLocationService();
    await checkAndRequestPermissionLocation();
    return await location.getLocation();
  }
}
