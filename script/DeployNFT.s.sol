//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {NFT} from "../src/NFT.sol";

contract  DeployNFT is Test {
    function run() external returns (NFT) {
        vm.startBroadcast();
        NFT nft = new NFT();
        vm.stopBroadcast();
        return nft;
    }
}
