import Constants from '../constants';
import QuotesAPI from '../api/quotes';

const Actions = {};


Actions.createQuote = (content, dispatch) => {
  QuotesAPI.createQuote(content).then(function (response) {
    let id = response.data.data.id;
    let createdQuote = {id: id, content: content};

    dispatch({
      type: Constants.QUOTE_CREATED,
      createdQuote: createdQuote
    })
  })
}

Actions.fetchQuotes = (dispatch) => {
  QuotesAPI.getQuotes().then(function (response) {
    let fetchedQuotes =
      response.data.data.map(function(jsonapiObject) {
        return Object.assign(
          {id: jsonapiObject.id }, jsonapiObject.attributes); }
        );
    dispatch({
      type: Constants.QUOTES_FETCHED,
      fetchedQuotes: fetchedQuotes
    })
  })
}

export default Actions;
