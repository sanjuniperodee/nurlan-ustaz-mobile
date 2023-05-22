import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/qiblah_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahPage extends StatefulWidget {
  const QiblahPage({super.key});

  @override
  State<QiblahPage> createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          builder: (context, snapshot) {
            if (hasPermission) {
              return const QiblahWidget();
            } else {
              return const Scaffold(
                backgroundColor: Color.fromARGB(255, 48, 48, 48),
              );
            }
          },
          future: getPermission(),
        ));
  }
}
