import 'package:nurlan_ustaz_flutter/core/model/async_app_dependecies.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/main_runner.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/nesu_vesu_app.dart';

Future<void> main() => MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) => const NurlanUstazApp(),
    );
