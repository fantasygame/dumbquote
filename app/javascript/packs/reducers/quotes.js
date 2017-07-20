import Constants from "../constants"

const initialState = {
  quotes: [{ content: "quote1" }, { content: "quote2" }]
};

export default function reducer(state = initialState, action = {}) {
  switch (action.type) {
    default:
      return state;
  }
}
