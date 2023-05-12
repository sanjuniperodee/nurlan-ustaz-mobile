import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class NotAuthLogic {
  BehaviorSubject<int> statusSubject = BehaviorSubject<int>();
}
