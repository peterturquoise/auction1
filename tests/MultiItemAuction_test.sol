// SPDX-License-Identifier: GPL-3.0
        
pragma solidity <0.9.0;

 /**
   * @title MultiItemAuctionTest
   * @dev MultiItemAuctionTest_desc
   * @custom:dev-run-script scripts/deploy_with_ethers.ts
   */

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "../contracts/5_MultiItemAuction.sol";
import "hardhat/console.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract MultiItemAuctionTest {

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'

    MultiItemAuction multiItemAuction;

    function setup() public {
        uint biddingTime = 1;
        
        uint[] memory itemIds = new uint[](3);
        itemIds[0] = 1;
        itemIds[1] = 2;
        itemIds[2] = 3;
        
        //uint[] memory startingBids1 = [10, 20, 30]; //- weirdly doesn't work - have to initialise them one at a time ...yayyy
        uint[] memory startingBids = new uint[](3);
        startingBids[0] = 10;
        startingBids[1] = 20;
        startingBids[2] = 30;
console.log("Errrr");
        multiItemAuction = new MultiItemAuction(biddingTime, itemIds, startingBids);
        console.log("Hiiiii");
        Assert.equal(uint(1), uint(itemIds[0]) , "1 should be equal to itemIds[0] ");
    }

    function beforeAll() public {

       // uint[] memory balance = [1, 2, 3];
        uint[3] memory arr2;
        //uint[] public myArray2 = [1, 2, 3]; 
        arr2[0] = 5;
        arr2[1] = 6;
        arr2[2] = 7;
        // <instantiate contract>
        setup();
    }

    function checkSuccess() public {
        // Use 'Assert' methods: https://remix-ide.readthedocs.io/en/latest/assert_library.html
        Assert.ok(2 == 2, 'should be true');
        Assert.greaterThan(uint(2), uint(1), "2 should be greater than to 1");
        Assert.lesserThan(uint(2), uint(3), "2 should be lesser than to 3");
    }

    function checkSuccess2() public pure returns (bool) {
        // Use the return value (true or false) to test the contract
        return true;
    }
    
    function checkFailure() public {
        Assert.notEqual(uint(1), uint(0), "1 should not be equal to 1");
    }

    /// Custom Transaction Context: https://remix-ide.readthedocs.io/en/latest/unittesting.html#customization
    /// #sender: account-1
    /// #value: 100
    function checkSenderAndValue() public payable {
        // account index varies 0-9, value is in wei
        //Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");
        Assert.equal(msg.value, 100, "Invalid value");
    }
}
    