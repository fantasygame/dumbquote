import Constants from "../constants"

const initialState = {
  quotes: []
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    case Constants.QUOTE_CREATED:
      let quotes = state.quotes;
      quotes.push(action.createdQuote);
      return { ...state, quotes: quotes };
    case Constants.QUOTES_FETCHED:
      return { ...state, quotes: action.fetchedQuotes };
    default:
      return state;
  }
}
