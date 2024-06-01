//SPDX-License-Identifier:GPL-3.0 
pragma solidity ^0.8.19;
contract modifierWithArg { 
      
  struct employee 
  { 
    uint emp_id; 
    string emp_name; 
    uint age; 
   } 
    
    modifier isExperienced(uint exp) 
    { 
        if(exp >= 5)  // Modifier condition check
            _;   // If condition is true, proceed to function body
        else
            revert("Must have a minimum of 5 years of experience"); 
    } 
  employee e; 
 function enterDetails (uint _empid, string memory _empname,  
                        uint _empage) public isExperienced(7)  { 
                                          // Modifier applied here
   e.emp_id = _empid; 
   e.emp_name = _empname; 
   e.age = _empage; 
 } 
} 

// flow of this code 
// 1. enterDeatails is called with specific arguments, execution starts
// 2. isExperienced modifier is checked with 7 as argument, as 7 is greater than 5, so _; is executed
// 3. e.emp_id = _empid; e.emp_name = _empname; e.age = _empage; is executed