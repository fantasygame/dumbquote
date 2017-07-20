import React from 'react'
import QuoteInput from './quoteInput'
import { connect } from 'react-redux'

class App extends React.Component {
  render() {
    return (
      <div>
        <QuoteInput dispatch={this.props.dispatch} />
        Dumb Quote
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
});

export default connect(mapStateToProps)(App);
