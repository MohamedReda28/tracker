import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylocationtruckerapp/core/servesce/git_it_Service.dart';
import 'package:mylocationtruckerapp/features/google_map/peresintation/veiws/googleMap_View.dart';

import 'core/servesce/CustomBlocObserver.dart';
import 'features/google_map/domin/googlemap_repo/googlemap_repo.dart';
import 'features/google_map/peresintation/manager/cubit/google_map_cubit.dart';
import 'features/google_map/peresintation/veiws/widgets/googleMapWidget.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupGitit();
  runApp(const GoogleMapTest());
}

class GoogleMapTest extends StatelessWidget {
  const GoogleMapTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GooglemapView(),
    );
  }
}
