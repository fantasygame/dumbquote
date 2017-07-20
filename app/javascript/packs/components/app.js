import React from 'react'
import Quote from './quote'
import QuoteInput from './quoteInput'
import { connect } from 'react-redux'
import Actions from '../actions/quotes'

class App extends React.Component {
  componentDidMount() {
    const { dispatch } = this.props;
    Actions.fetchQuotes(dispatch);
  }

  _renderQuotes(quotes) {
    return quotes.map((quote) => {
      return <Quote key={quote.id} content={quote.content} />
    });
  }

  render() {
    return (
      <div>
        <QuoteInput dispatch={this.props.dispatch} />
        {::this._renderQuotes(this.props.quotes.quotes)}
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
  quotes: state.quotes
});

export default connect(mapStateToProps)(App);
