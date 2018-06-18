import React, { Component } from 'react';
import {
    StyleSheet,
    Text,
    TouchableOpacity,
    View,
    NativeModules,
    NativeEventEmitter,
} from 'react-native';

export default class App extends Component<Props> {

    constructor(props) {
        super(props);

        this.state = {
            count: 0,
        };
    }

    componentDidMount() {
        const { UserStatusManager } = NativeModules;
        const emitter = new NativeEventEmitter(UserStatusManager);

        this._subscription = emitter.addListener(
            'UserStatusChanged',
            this._onReceiveEvent,
        );
    }

    componentWillUnmount() {
        this._subscription.remove();
    }

    _onReceiveEvent = () => {
      this.setState(preState => {
          return {
              count: preState.count + 1
          };
      });
    };

    render() {
        return (
            <View style={styles.container}>
                <Text>Event Count: {this.state.count}</Text>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'white',
    },
    button: {
        backgroundColor: 'orange',
        color: 'white',
        width: 100,
        height: 50,
        alignItems: 'center',
        justifyContent: 'center'
    }
});
