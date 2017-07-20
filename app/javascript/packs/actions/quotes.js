import Constants from '../constants';

const Actions = {};


Actions.createQuote = (content, dispatch) => {
  let createdQuote = {id: 1, content: "Created quote"} // Fake api result
  dispatch({
    type: Constants.QUOTE_CREATED,
    createdQuote: createdQuote
  })
}

export default Actions;
