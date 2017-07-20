import React from 'react'
import { connect } from 'react-redux'
import Actions from '../actions/quotes'

export default class QuoteInput extends React.Component {
  _createQuote(e) {
    e.preventDefault();
    const { contentInput } = this.refs;
    const content = contentInput.value;
    const { dispatch } = this.props;
    Actions.createQuote(content, dispatch);
    this._clearInput();
    this._focusOnInput();
  }

  _clearInput() {
    this.refs.contentInput.value = '';
  }

  _focusOnInput() {
    this.refs.contentInput.focus();
  }

  render() {
    return (
      <div>
        <form onSubmit={::this._createQuote}>
          <div className="input-group">
            <input className="form-control" type="text" ref="contentInput"/>
            <span className="input-group-btn">
              <button className="btn btn-default" type="submit">Add Quote</button>
            </span>
          </div>
        </form>
      </div>
    )
  }
}
