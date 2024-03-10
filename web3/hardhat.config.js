const { toolbox } = require("@nomicfoundation/hardhat-toolbox");

const config = {
  solidity: "0.8.19",
  networks: {
    etherlinkTest: {
      url: "https://node.ghostnet.etherlink.com",
      accounts: "[REDACTED]",
    }
  }
};

module.exports = config;
