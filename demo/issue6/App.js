/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  StyleSheet,
  Text,
  View,
  requireNativeComponent
} from 'react-native';


const NativeDemoView = requireNativeComponent('DemoView');


export default class App extends Component {
  onChangeValue = (event) => {
    const { value } = event.nativeEvent || {};
    this.setState({
        value
    });
  };
  
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.title}>
          DEMO for issue6
        </Text>
        <Text style={styles.message}>
          javascript value: {this.state && this.state.value}
        </Text>
        <NativeDemoView 
          style={styles.nativeView}
          onChangeValue={this.onChangeValue}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 50,
    paddingLeft: 30,
  },
  title: {
    height: 50,
    fontSize: 25,
    fontWeight: 'bold',
  },
  message: {
    height: 30,
    fontSize: 16,
  },
  nativeView: {
    width: 200,
    height: 200,
    backgroundColor: 'orange',
  }
});
