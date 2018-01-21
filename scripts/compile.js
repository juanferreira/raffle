const path = require('path');
const fs = require('fs');
const solc = require('solc');

const rafflePath = path.resolve(__dirname, '../contracts/Raffle.sol');
const sourceCode = fs.readFileSync(rafflePath, 'utf8');

module.exports = solc.compile(sourceCode, 1).contracts;