const global = this;

const stringInModule = 'this is a string created in javascript';
global.numberInGlobal = 1;
global.boolInGlobal = true;
global.dateInGlobal = new Date();

global.arrayInGlobal = [stringInModule, numberInGlobal, boolInGlobal, dateInGlobal];
global.objectInGlobal = {
	stringInModule,
	numberInGlobal,
    boolInGlobal,
    dateInGlobal,
	scope: 'global'
};

global.funcInGlobal = (...args) => {
    console.log('hello world from javascript', args);
};


