// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

contract mintNFT is Script {
    string public constant PET_COLLECTION = "https://ipfs.io/ipfs/QmWfGpfUCSGPAjCrZw5kWHjVBcNkRrAgz6fragHmXJNE8B";

    // Use the CORRECT checksummed address
    address constant NFT_ADDRESS = 0xD24445002233fCd122ed44c66186CF59B512A2aA;

    function run() external {
        mintNFTOnContract(NFT_ADDRESS);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        NFT(contractAddress).mintNFT(PET_COLLECTION);
        vm.stopBroadcast();
    }
}
