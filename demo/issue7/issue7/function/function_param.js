const global = this;

global.paramNumberTest = function (a, b) {
    console.log('this is a js function designed to accept two params: ', a, b);
	console.log('params passed in this time:', arguments)
};

global.acceptStringParam = (string) => {
	console.log('this is a js function designed to accept one param of string type');
	if (typeof string !== 'string') {
		console.warn('but you passed in wrong type: ', string);
		return;
	}

	console.log('the param you passed in is right: ', string);
};

global.acceptNumberParam = (number) => {
	console.log('this is a js function designed to accept one param of number type');
	if (typeof number !== 'number') {
		console.warn('but you passed in wrong type: ', number);
		return;
	}

	console.log('the param you passed in is right: ', number);
};

global.acceptBoolParam = (bool) => {
	console.log('this is a js function designed to accept one param of bool type');
	if (typeof bool !== 'boolean') {
		console.warn('but you passed in wrong type: ', bool);
		return;
	}

	console.log('the param you passed in is right: ', bool);
};

global.acceptDateParam = (date) => {
	console.log('this is a js function designed to accept one param of date type');
	if (typeof date !== 'object' || !(date instanceof Date)) {
		console.warn('but you passed in wrong type: ', date);
		return;
	}

	console.log('the param you passed in is right: ', date);
};

global.acceptArrayParam = (array) => {
    console.log('this is a js function designed to accept one param of array type');
    if (typeof array !== 'object' || !(array instanceof Array)) {
        console.warn('but you passed in wrong type: ', array);
        return;
    }
    
    console.log('the param you passed in is right: ', array);
};

global.acceptObjectParam = (object) => {
    console.log('this is a js function designed to accept one param of object type');
    if (typeof object !== 'object') {
        console.warn('but you passed in wrong type: ', object);
        return;
    }
    
    console.log('the param you passed in is right: ', object);
};

global.acceptFunctionParam = (func) => {
    console.log('this is a js function designed to accept one param of function type');
    if (typeof func !== 'function') {
        console.warn('but you passed in wrong type: ', func);
        return;
    }
    
    console.log('the param you passed in is right: ', func);
};
