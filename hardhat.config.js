require("@nomicfoundation/hardhat-toolbox");

const { alchemyApiKey, privateKey } = require('./secret.json');

module.exports = {
  solidity: {
    version: "0.8.17",
  },
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${alchemyApiKey}`,
      accounts: [privateKey],
    },
  }
};
