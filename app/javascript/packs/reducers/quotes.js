import Constants from "../constants"

const initialState = {
  quotes: []
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    case Constants.QUOTE_CREATED:
      state.quotes.push(action.createdQuote);
      return { ...state, quotes: state.quotes };
    default:
      return state;
  }
}
