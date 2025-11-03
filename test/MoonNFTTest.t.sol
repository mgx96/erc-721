//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {MoodNFT} from "../src/MoodNFT.sol";

contract MoodNFTTest is Test {
    MoodNFT private moodNFT;
    string private constant BOWTIE_SVG_URI = "<svg>...bowtie svg...</svg>"; // Replace with actual SVG
    string private constant STARE_SVG_URI = "<svg>...stare svg...</svg>"; // Replace with actual SVG

    address public USER = makeAddr("user");

    function setUp() public {
        moodNFT = new MoodNFT(BOWTIE_SVG_URI, STARE_SVG_URI);
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        moodNFT.mintNFT();
        console.log(moodNFT.tokenURI(0));
    }
}
