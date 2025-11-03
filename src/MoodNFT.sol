//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_bowtieSvg;
    string private s_stareSvg;

    enum Mood {
        BOWTIE,
        STARE
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(string memory bowtieSvg, string memory stareSvg) ERC721("PoseidonNFT", "POSEIDON") {
        s_tokenCounter = 0;
        s_bowtieSvg = bowtieSvg;
        s_stareSvg = stareSvg;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == Mood.BOWTIE) {
            imageURI = s_bowtieSvg;
        } else {
            imageURI = s_stareSvg;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{ "name": "',
                            name(),
                            '", "description": "Reflects the mood of Poseidon", "attributes": [ { "trait_type": "mood", "value": "100"}], "image": "',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
}
