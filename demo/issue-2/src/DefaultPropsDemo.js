import React, { Component } from 'react';
import PropTypes from 'prop-types';

class DefaultPropsDemo extends Component {
    static propTypes = {
        arrayProp: PropTypes.array,
    };

    static defaultProps = {
        arrayProp: [],
    };

    render() {
        return (
            <div>
                <p>arrayProp type：{typeof this.props.arrayProp}</p>
                <p>arrayProp value: {JSON.stringify(this.props.arrayProp)}</p>
            </div>
        );
    }
}

export default DefaultPropsDemo;
