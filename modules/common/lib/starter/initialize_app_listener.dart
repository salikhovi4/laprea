import 'dart:collection';

abstract class InitializeAppListener {
  Future<void> init();
}

abstract class InitializeAppListenersHolder {
  UnmodifiableListView<InitializeAppListener> get listeners;

  void registerListener(InitializeAppListener listener);
}

class InitializeAppListenersHolderImpl implements InitializeAppListenersHolder {
  final List<InitializeAppListener> _listeners = [];

  InitializeAppListenersHolderImpl();

  @override
  void registerListener(InitializeAppListener listener) {
    _listeners.add(listener);
  }

  @override
  UnmodifiableListView<InitializeAppListener> get listeners => UnmodifiableListView(_listeners);
}
