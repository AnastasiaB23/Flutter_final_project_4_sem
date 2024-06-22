class CounterState {
  CounterState({
    this.value = 0,
  });
  final int value;

  CounterState copyWith({int? count}) {
    return CounterState(
      value: count ?? value,
    );
  }
}


