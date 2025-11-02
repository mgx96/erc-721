//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_bowtieSvg;
    string private s_stareSvg;

    constructor(string memory bowtieSvg, string memory stareSvg) ERC721("PoseidonNFT", "POSEIDON") {
        s_tokenCounter = 0;
        s_bowtieSvg = bowtieSvg;
        s_stareSvg = stareSvg;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {}
}
