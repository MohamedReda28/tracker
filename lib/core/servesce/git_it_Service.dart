import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:mylocationtruckerapp/core/servesce/ApiServese.dart';
import 'package:mylocationtruckerapp/core/servesce/dataBaseServece.dart';
import 'package:mylocationtruckerapp/core/servesce/location_servece.dart';
import 'package:mylocationtruckerapp/features/google_map/data/googlemap_repoimple/googlemap_repoimple.dart';
import 'package:mylocationtruckerapp/features/google_map/domin/googlemap_repo/googlemap_repo.dart';

final getIt = GetIt.instance;

void setupGitit() {
  getIt.registerSingleton<LocationServece>(
      LocationServece(location: Location()));
  getIt.registerSingleton<DataBaseServese>(ApiServese(Dio()));

  getIt.registerSingleton<GooglemapRepo>(
    GooglemapRepoimple(
        locationServece: getIt<LocationServece>(),
        dataBaseServese: getIt<DataBaseServese>()),
  );
}
