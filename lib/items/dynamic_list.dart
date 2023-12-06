class DynamicList {
  final String name;
  bool isDone;

  DynamicList({required this.name, this.isDone = false});

  void doneChange() {
    isDone = !isDone;
  }
}
