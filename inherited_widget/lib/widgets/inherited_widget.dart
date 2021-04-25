import 'package:flutter/cupertino.dart';
import 'package:inherited_widget/model/core_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  CoreState state = CoreState();

  void increment() {
    final counter = state.counter + 1;
    final newState = state.copy(counter: counter);
    setState(() => state = newState);
  }

  void setColor(Color backgroundColor) {
    final newState = state.copy(backgroundColor: backgroundColor);
    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
        child: widget.child,
        state: state,
        stateWidget: this,
      );
}

/// [InheritedWidget]
class StateInheritedWidget extends InheritedWidget {
  final CoreState state;
  final _StateWidgetState stateWidget;

  StateInheritedWidget({
    Key key,
    @required Widget child,
    @required this.state,
    @required this.stateWidget,
  }) : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()
      .stateWidget;

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) =>
      oldWidget.state != state;
}
