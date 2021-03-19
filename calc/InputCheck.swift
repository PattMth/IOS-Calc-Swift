//
//  InputChecker.swift
//  calc
//
//  Created by Pattrick Matthew Hartono on 17/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

struct InputCheck{
    
    let userInput: [String];
    let i = 0;

func inputCheck() ->  Bool 
{
    for i in stride(from: 1, to: userInput.count-1, by: 2) // check if the operator is valid
    {
        if (!["+","-","/","x","*","%"].contains(userInput[i]))
            { 
                ErrorCheck().operatorNotRecognized();
                return false;
            }
    }
	
    for i in stride(from: 0, to: userInput.count, by: 2)// check if every number is int
        {
            if (Int(userInput[i]) == nil)
            {
                    ErrorCheck().validity();
                    return false;
            }
        }
    if (Int(args[0]) == nil && args.count == 1 || userInput.isEmpty || userInput.count % 2 == 0)
    {// check if input is valid e.g not empty, have at least 1 operation
        print(Int(userInput[0])!);
        ErrorCheck().validity();
        return false;
    }
    return true;
    }
}
