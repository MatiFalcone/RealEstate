pragma solidity ^0.5.16;

contract RealEstate {

	// Declared variables
	address payable public seller;
	address public buyer;
	string public streetAddress;
	string title;
	uint256 public price;

	constructor () public {

		// Who is the seller?
		seller = msg.sender;
		// What is the street address?
		streetAddress = "350 5th Ave, New York, NY 10118";
		// What is the title?
		title = "4d186321c1a7f0f354b297e8914ab240";
		// What is the price?
		price = 99000000000000000000; // 99 ETH

	}

	function buyHouse () payable public {

		// The seller is present
		require(seller != address(0));

		// The buyer is not set yet
		require(buyer == address(0));

		// The buyer is not the seller (I'm not buying my own house)
		require(msg.sender != seller);

		// The amount we are paying for the house is the exact price
		require(msg.value == price);

		// Set the buyer
		buyer = msg.sender;

		// Send ETH to the seller
		seller.transfer(msg.value);

	}

}