const { toolbox } = require("@nomicfoundation/hardhat-toolbox");

const config = {
  solidity: "0.8.19",
  networks: {
    etherlinkTest: {
      url: "https://node.ghostnet.etherlink.com",
      accounts: "4d3f0c7c7e200fac06c872a18eb1e9bd195c7e0682d29ca4bda9055aed05bf2d",
    }
  }
};

module.exports = config;
