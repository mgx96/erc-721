//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {DeployMoodNFT} from "../script/DeployMoodNFT.s.sol";

contract DeployMoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testConvertSvgToURI() public view {
        string memory expectedURI = "data:image/svg+xml;base64,PHN2Zz4uLi5ib3d0aWUgc3ZnLi4uPC9zdmc+"; // Replace with actual expected URI
        string memory svg = "<svg>...bowtie svg...</svg>"; // Replace with actual SVG
        string memory imageURI = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(imageURI)) == keccak256(abi.encodePacked(expectedURI)));
    }
}
