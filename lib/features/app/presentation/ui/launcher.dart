// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

// class LauncherApp extends StatefulWidget {
//   const LauncherApp({super.key});
//   @override
//   State<LauncherApp> createState() => _LauncherAppState();
// }

// class _LauncherAppState extends State<LauncherApp> {
//   @override
//   void initState() {
//     init();
//     super.initState();
//   }

//   Future<void> init() async {
//     // BlocProvider.of<AppBloc>(context).add(const AppEvent.checkAuth());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppBloc, AppState>(
//       builder: (context, state) {
//         return state.maybeWhen(
//           onBoardingState: () {
//             return const WelComePage();
//           },
//           loadingState: () {
//             return const _Scaffold(
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.amber,
//                 ),
//               ),
//             );
//           },
//           // notAuthorizedState: () {
//           //   return const Base();
//           //   // return const SignInPage();
//           // },
//           // notVerifyed: () {
//           //   return const SizedBox();
//           // },
//           errorState: (String message) {
//             return const _Scaffold(
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.red,
//                 ),
//               ),
//             );
//           },
//           // inAppState: () {
//           //   return const Base();
//           // },
//           orElse: () {
//             return const Base();
//           },
//         );
//       },
//       listener: (context, state) {
//         state.whenOrNull(
//           inAppState: () {
//             // BlocProvider.of<ProfileCubit>(context).getProfile();
//           },
//         );
//       },
//     );
//   }
// }

// class _Scaffold extends StatelessWidget {
//   final Widget child;
//   const _Scaffold({
//     required this.child,
//     // super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SafeArea(child: child),
//     );
//   }
// }
