import { ethers } from "hardhat";

async function main() {
  const Link = await ethers.getContractFactory("Link");
  const LNK = await Link.deploy();
  await LNK.deployed();

  const web3B = await ethers.getContractFactory("W3b");
  const W3B = await web3B.deploy();
  await W3B.deployed();

  const TokenSwap = await ethers.getContractFactory("TokenSwap");
  const tokenSwap = await TokenSwap.deploy(LNK.address, W3B.address);

  await tokenSwap.deployed();

  console.log(`${tokenSwap} deployed to ${tokenSwap.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
