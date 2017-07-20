import Constants from '../constants';

const Actions = {};


Actions.createQuote = (content, dispatch) => {
  let createdQuote = {id: 3, content: "Created quote"} // Fake api result
  dispatch({
    type: Constants.QUOTE_CREATED,
    createdQuote: createdQuote
  })
}

Actions.fetchQuotes = (dispatch) => {
  let fetchedQuotes = [{id: 1, content: "Fetched quote 1"}, {id: 2, content: "Fetched quote 2"}] // Fake api result
  dispatch({
    type: Constants.QUOTES_FETCHED,
    fetchedQuotes: fetchedQuotes
  })
}

export default Actions;
