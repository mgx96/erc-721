// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

// ⛔️ Remove DevOpsTools import – it's what's triggering vm.readDir
// import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract mintNFT is Script {
    string public constant PET_COLLECTION = "https://ipfs.io/ipfs/QmWfGpfUCSGPAjCrZw5kWHjVBcNkRrAgz6fragHmXJNE8B";

    // Use the CORRECT checksummed address
    address constant NFT_ADDRESS = 0xD24445002233fCd122ed44c66186CF59B512A2aA;

    function run() external {
        // ⛔️ Remove this – it triggers vm.readDir and reverts on your system
        // address mostRecentDeployment = DevOpsTools.get_most_recent_deployment("NFT", block.chainid);

        // ✅ Just mint on your known deployed address
        mintNFTOnContract(NFT_ADDRESS);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        NFT(contractAddress).mintNFT(PET_COLLECTION);
        vm.stopBroadcast();
    }
}
