// SPDX-Licennce-Identifier: MIT
pragma solidity >=0.6.6 <0.9.0;


interface AggregatorV3Interface {

    function decimals()
    external
    view
    returns (
        uint8
    );

    function description()
    external
    view
    returns (
        string memory
    );

    function version()
    external
    view
    returns (
        uint256
    );

    // getRoundData and latestRoundData should both raise "No data present"
    // if they do not have data to report, instead of returning unset values
    // which could be misinterpreted as actual reported values.
    function getRoundData(
        uint80 _roundId
    )
    external
    view
    returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );

    function latestRoundData()
    external
    view
    returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );

}

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        // what the ETH -> USD  conversion rate
    }
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound)
            = priceFeed.latestRoundData();
            return uint256(answer);
    }

}


      //url: "https://rinkeby.etherscan.io/address/0xe34cfa55c84c521bf4b378e50af5b73ba0cdf9c2",
      //url: "https://eth-rinkeby.alchemyapi.io/v2/123abc123abc123abc123abc123abcde",
      //accounts: [
      //  "9ee5a203aaad01ff447aecc5ff628cc3953f8f1153d45c4305e958dc344960ca",
