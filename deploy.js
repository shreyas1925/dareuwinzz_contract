const HDWalletProvider = require("truffle-hdwallet-provider");
const Web3 = require("web3");
const { interface, bytecode } = require("./compile");

const provider = new HDWalletProvider(
  "volume addict mimic forum oven mushroom flush grant result poem situate ship",
  "https://rinkeby.infura.io/v3/4a735ee5dfb14b84a8d2f19957760981"
);

const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();
  console.log("Attempting to deploy from account", accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({
      data: bytecode,
    })
    .send({ gas: "1000000", from: accounts[0] });

  console.log("Contract deployed to", result.options.address);
};
// 0xf20b26b3D19c4fC0ca81A87962aeC181bF5DBaA9 --> present one
// 0xf0D0E0a6b4D945f938F66d7Fd3f5C08e2664328d --> old one
deploy();
