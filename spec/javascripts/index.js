require('libs');
require('./polyfills/objectAssign');
require('./extra/jasmine-sinon');
require('./extra/jasmine-jquery');
require('es6-promise/auto');
import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

var context = require.context('.', true, /.+_spec\.js$/);

context.keys().forEach(context);

Enzyme.configure({ adapter: new Adapter() });

module.exports = context;
