import React from 'react';
import ReactDOM from 'react-dom';
import DefaultPropsDemo from './DefaultPropsDemo';

// 如果不传入参数，参数直接使用默认值
const demoComponent = <DefaultPropsDemo/>;

// 如果传入 null，参数会直接使用 null 作为值，不会使用默认值
// const demoComponent = <DefaultPropsDemo arrayProp={null}/>;

// 如果传入 undefined，参数会使用默认值
// const demoComponent = <DefaultPropsDemo arrayProp={undefined}/>;

ReactDOM.render(demoComponent, document.getElementById('root'));
