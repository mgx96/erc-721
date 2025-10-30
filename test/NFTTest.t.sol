//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {DeployNFT} from "../script/DeployNFT.s.sol";
import {NFT} from "../src/NFT.sol";

contract NFTTest is Test {
    NFT public nft;
    DeployNFT public deployer;
    address public USER = makeAddr("user");
    string public constant PET_COLLECTION = "ipfs://QmbL6Qd1435L4Yc2WR1rufRLDMoQL5XQbDXRoQQhhohmoQ";

    function setUp() public {
        deployer = new DeployNFT();
        nft = deployer.run();
    }

    function testNameIsHuskyNFT() public view {
        string memory expectedName = "Husky";
        string memory actualName = nft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    //Comparing strings works fine with forge's assertEq as it implicitly does the keccak256 comparison
    function testSymbolIsHUSKY() public view {
        assertEq(nft.symbol(), "HSKY");
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        nft.mintNFT(PET_COLLECTION);

        assert(nft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PET_COLLECTION)) == keccak256(abi.encodePacked(nft.tokenURI(0))));
    }
}