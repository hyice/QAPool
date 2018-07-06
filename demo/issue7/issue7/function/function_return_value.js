const global = this;

global.stringResult = () => {
    return 'this is a js string';
};

global.numberResult = () => {
    return 123.21;
};

global.boolResult = () => {
    return true;
};

global.dateResult = () => {
    return new Date();
};

global.arrayResult = () => {
    return ['a', 'b', 1, 2];
};

global.objectResult = () => {
    return {a: 1, b: 2, c: 'c'};
};

global.funcResult = () => {
    return () => {
        console.log('this is a js function');
    };
};
