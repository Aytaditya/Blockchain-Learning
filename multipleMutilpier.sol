
//SPDX-License-Identifier:GPL-3.0 
pragma solidity ^0.8.19; 
contract multiplemodifier { 
address admin; 
struct employee 
{ 
	uint emp_id; 
	string emp_name; 
	uint age; 
} 
	
constructor() public
{ 
	admin = msg.sender; 
} 
	
	modifier isAdmin 
	{ 
		require(admin == msg.sender); 
		_; 
	} 
	modifier isExperienced(uint exp) 
	{ 
		if(exp>=5) 
			_; 
		else
			revert("Must have a minimum of 5 years of experience"); 
	} 
employee e; 
function enterDetails (uint _empid, string memory _empname, 
						uint _empage) public isAdmin isExperienced(7) { 
e.emp_id = _empid; 
e.emp_name = _empname; 
e.age = _empage; 
} 
} 
