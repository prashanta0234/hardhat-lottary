// require('hardhat-deploy');
const { network } = require("hardhat")
module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy } = deployments
    const { deployer } = await getNamedAccounts()
    await deploy("Raffle", {
        from: deployer,
        args: [],
        log: true,
        waitConfirmation: network.blockConfirmation || 1,
    })
}
module.exports.tags = ["Raffle"]
