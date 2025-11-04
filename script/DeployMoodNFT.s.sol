//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNFT is Script {
    function run() external returns (MoodNFT) {
        string memory bowtieSVG = "<svg>...bowtie svg...</svg>"; // Replace with actual SVG
        string memory stareSVG = "<svg>...stare svg...</svg>"; // Replace with actual SVG

        vm.startBroadcast();
        MoodNFT moodNFT = new MoodNFT(svgToImageURI(bowtieSVG), svgToImageURI(stareSVG));
        vm.stopBroadcast();
        return moodNFT;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(abi.encodePacked(svg)));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
