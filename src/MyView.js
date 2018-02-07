import React, { Component } from 'react';
import {View,StyleSheet,Dimensions,NativeEventEmitter,NativeModules} from 'react-native';
import  ZPShareBt from  './TestView'
const  {width, height} = Dimensions.get('window')


export default  class MyView extends Component {

    componentDidMount() {

    }

    componentWillUnmount() {

    }

    cellClick(pams){
        console.log(pams,1222)
    }
    render() {
        return (
            <ZPShareBt style={styles.map}
                       changeValue={111}
                       onRegionChange = {(pams)=>{this.cellClick(pams)}}
                       datas={['北美风格','传统风格','欧洲风格','价格选择','面积选择']}



            />

        );
    }
}

const  styles = StyleSheet.create({
    map:{
        flex:1,

    }
})
