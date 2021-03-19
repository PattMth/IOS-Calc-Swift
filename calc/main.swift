//
//  main.swift
//  calc
//
//  Created by Pattrick Matthew H on 11/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
//let no2 = args[2]; // Sample Code Only! Update Required!


if(InputCheck(userInput: args).inputCheck())
{
    if(args.count == 1)
	{//parseInt OoB
        if(Int(args[0]) != nil)
		{
			print(Int(args[0])!)
        }
        else
		{
            ErrorCheck().validity();
        }
    }
    else if(args.count > 2) // start calculator
	{
		let calc = Calculator(args: args);
        let finalResult = calc.calculate();
        print(finalResult);
    }
}

