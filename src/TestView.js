import React, { Component } from 'react';
import { View,requireNativeComponent } from 'react-native';
var ShareBt = requireNativeComponent('TestManagerView', ZPShareBt);
import PropTypes  from 'prop-types';

export default class ZPShareBt extends Component {
    static propTypes = {
        isChangeBackground:  PropTypes.bool,
        changeValue:   PropTypes.number,
        datas:  PropTypes.arrayOf,
        onChange: PropTypes.func
    }
    componentDidMount() {
        console.log("MyView被加载了",this.props.changeValue);
    }

    _onChange = (event: Event) => {
        if (!this.props.onRegionChange) {
            return;
        }
        this.props.onRegionChange(event);
    }
    render() {
        return(
            <ShareBt {...this.props} onClickBanner={(event)=>{this._onChange(event.nativeEvent)}}/>
        );
    }
}
