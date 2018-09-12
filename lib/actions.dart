enum Actions {
  Increment,
  Decreasement,
  Clear,
}

int counterReducer(int state, dynamic action) {
  switch (action) {
    case Actions.Increment:
      return state + 1;
    case Actions.Decreasement:
      return state - 1;
    case Actions.Clear:
      return 0;
    default:
      return state;
  }
}

