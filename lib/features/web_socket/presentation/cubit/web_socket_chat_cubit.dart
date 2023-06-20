// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:nesuvesu_new/core/platform/network_helper.dart';
// import 'package:nesuvesu_new/features/auth/data/datasoures/local/auth_local_ds.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// import '../model/web_socket_model.dart';

// part 'web_socket_order_state.dart';
// part 'web_socket_order_cubit.freezed.dart';

// @injectable
// class WebSocketOrderCubit extends Cubit<WebSocketOrderState> {
//   final AuthLocalDs localDS;
//   WebSocketOrderCubit(this.localDS)
//       : super(const WebSocketOrderState.initial());
//   late WebSocketChannel channel;
//   Future<void> webScoketConnect(int order) async {
//     log('ws://89.46.34.127${EndPoints.wsOrsded}$order?token=${localDS.getTokenFromCache().access}');
//     final wsUrl = Uri.parse(
//         'ws://89.46.34.127${EndPoints.wsOrsded}$order?token=${localDS.getTokenFromCache().access}');
//     try {
//       channel = WebSocketChannel.connect(wsUrl);
//       channel.sink.add(
//         jsonEncode(
//           {
//             "action": "subscribe_to_order",
//             "request_id": 123,
//           },
//         ),
//       );
//       emit(const WebSocketOrderState.searching());
//       channel.stream.listen(
//         (message) {
//           log("wsEvent===${message.toString()}");
//           if (message.toString() == '{"message": "subscribed"}') {
//             log("true");
//             channel.sink.add(
//               jsonEncode(
//                 {"action": "get_filtered_couriers", "request_id": 123},
//               ),
//             );
//           }
//           if (message.toString().contains("is_free")) {
//             channel.sink.add(
//               jsonEncode(
//                   {"action": "get_filtered_couriers", "request_id": 123}),
//             );
//           }
//           if (message.toString().contains('data')) {
//             try {
//               log(message.runtimeType.toString());
//               WebSocketModel goCustomer =
//                   WebSocketModel.fromRawJson(message.toString());
//               log(goCustomer.status.toString());
//               if (goCustomer.status == "go_customer" ||
//                   goCustomer.status == "in_progress" ||
//                   goCustomer.status == "go_endpoint") {
//                 emit(WebSocketOrderState.subscribedOrderState(goCustomer));
//               } else if (goCustomer.status == "completed") {
//                 emit(WebSocketOrderState.comleted(goCustomer.courier!));
//               }
//             } catch (e) {
//               log(e.toString());
//             }
//           }
//         },
//         onError: (e) {
//           log(e);
//         },
//         onDone: () {
//           if (kDebugMode) {
//             print('WebSocket закрыт');
//           }
//         },
//       );
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   Future<void> cancellOrder() async {
//     channel.sink.add(
//       jsonEncode(
//         {
//           "action": "refuse_order_by_customer",
//           "request_id": 123,
//           "comment": "Случайно нажал"
//         },
//       ),
//     );
//     emit(const WebSocketOrderState.cansellOrderSuccsess());
//   }

//   Future<void> comleteOrder(int? raiting) async {
//     channel.sink.add(
//       jsonEncode({
//         "action": "complete_order",
//         "request_id": 123,
//         "rating": raiting ?? 0,
//       }),
//     );
//     channel.sink.close();
//   }

//   Future<void> closeWebSocket() async {
//     channel.sink.close();
//   }
// }
