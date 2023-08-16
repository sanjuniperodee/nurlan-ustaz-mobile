import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/qiblah_widget.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class QiblahPage extends StatefulWidget {
  const QiblahPage({super.key});

  @override
  State<QiblahPage> createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _deviceSupport,
      builder: (_, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (snapshot.hasError)
          return Center(
            child: Text("Error: ${snapshot.error.toString()}"),
          );

        if (snapshot.data!)
          return const QiblahWidget();
        else
          return Container();
      },
    );
  }
}
