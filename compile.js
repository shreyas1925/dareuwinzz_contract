const path = require("path");
const fs = require("fs");
const solc = require("solc");
const lotterpath = path.resolve(__dirname, "contracts", "Dare.sol");
const source = fs.readFileSync(lotterpath, "utf8");

console.log(solc.compile(source, 1));
// console.log(source);

module.exports = solc.compile(source, 1).contracts[":Dare"];
