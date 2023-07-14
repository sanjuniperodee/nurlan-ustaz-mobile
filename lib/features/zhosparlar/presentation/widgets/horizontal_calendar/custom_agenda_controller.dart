import 'custom_horizontal_calendar.dart';

// CalendarController
class CustomCalendarAgendaController {
  CustomCalendarAgendaState? state;

  void bindState(CustomCalendarAgendaState state) {
    this.state = state;
  }

  void goToDay(DateTime date) {
    state!.getDate(date);
  }

  void dispose() {
    state = null;
  }
}
