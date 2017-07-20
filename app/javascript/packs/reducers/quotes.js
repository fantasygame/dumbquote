import Constants from "../constants"

const initialState = {
  quotes: [{ id: 1, content: "quote1"}, { id: 2, content: "quote2"}]
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    default:
      return state;
  }
}
