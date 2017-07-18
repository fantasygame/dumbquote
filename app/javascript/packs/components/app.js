import React from 'react'
import { connect } from 'react-redux'

class App extends React.Component {
  render() {
    return (
      <div>
        Dumb Quote
      </div>
    )
  }
}

const mapStateToProps = (state) => ({
});

export default connect(mapStateToProps)(App);
