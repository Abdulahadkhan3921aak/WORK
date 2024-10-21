const json2csv = require('json2csv').parse;
const fs = require('fs');

const inputJSON = require('./input.json');
const csv = json2csv(inputJSON);

fs.writeFileSync('output.csv', csv);
