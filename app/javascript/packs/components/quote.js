import React from 'react'

export default class Quote extends React.Component {
  render() {
    return (
      <div>
        {this.props.content}
      </div>
    )
  }
}
