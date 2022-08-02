const { network } = require("hardhat");

module.exports={
     async ({getNamedAccounts, deployments}) {
          const {deploy,log} = deployments;
          const {deployer} = await getNamedAccounts();
          const chainId= network.config.chainId;
          const BASE_FEE="250000000000000000";
          const GAS_PRICE_LINK= 1e9;
        
          if(chainId == 31337){
              log("mocks deploying>>>>")
              await deploy('VRFCoordinatorV2Mock', {
               from: deployer,
               args: [BASE_FEE,GAS_PRICE_LINK],
               log: true,
             });
             log("Mocks Deployed!")
             log("<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>")
             log("You are deploying to a local network, you'll need a local network running to interact")
             log(
                 "Please run `yarn hardhat console --network localhost` to interact with the deployed smart contracts!"
             )
             log("<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>")
          }
     }
}
module.exports.tags = ["all", "mocks"]