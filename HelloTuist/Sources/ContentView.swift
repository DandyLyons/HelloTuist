import ComposableArchitecture
import SwiftUI

@Reducer public struct ContentReducer {
  @ObservableState public struct State {
    var count = 0
  }
  public enum Action {
    case increment, decrement
  }
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
        case .increment:
          state.count += 1
          return .none
        case .decrement:
          state.count -= 1
          return .none
      }
    }
  }
}

public struct ContentView: View {
  public init() {}
  public let store = StoreOf<ContentReducer>(
    initialState: .init()) {
      ContentReducer()._printChanges()
    }
  
  public var body: some View {
    
    List {
      Text(store.count, format: .number)
        .contentTransition(.numericText(countsDown: false))
//        .animation(.default, value: store.count)
      Button("Up") { store.send(.increment, animation: .default)}
      Button("Down") { store.send(.decrement, animation: .default)}
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
