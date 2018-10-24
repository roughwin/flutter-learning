enum Actions {
  Increment,
  Decreasement,
  Clear,
  ShowSnackbar,
  SetToken,
  ClearToken,
}

Map counterReducer(Map state, dynamic action) {
  switch (action['type']) {
    case Actions.Increment:
      return { 'count': state['count'] + 1 };
    case Actions.Decreasement:
      return { 'count': state['count'] - 1 };
    case Actions.Clear:
      return { 'count': 0 };
    case Actions.ShowSnackbar:
      return { 'count': state['count'], 'msg': 'hello' };
    case Actions.SetToken:
      String token = action['token'];
      state['token'] = token;
      return state;
    default:
      return state;
  }
}

