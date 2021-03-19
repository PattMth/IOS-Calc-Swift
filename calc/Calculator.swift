//
//  Calculator.swift
//  calc
//
//  Created by Pattrick Matthew H on 11/3/20.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
	var firstNum = 0;
	var secondNum = 0;
	var pointer = 0;
	var mathOp: String;
    
    /// Perform Addition
    ///
    /// - Author: Pattrick Matthew H
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
	
	init(args: [String]) //initialize first set of operation when this class run
	{
		mathOp = args[pointer+1];
        if Int(args[pointer]) != nil
        {
            firstNum = Int(args[pointer])!;
        }
        if Int(args[pointer+2]) != nil
        {
            secondNum = Int(args[pointer+2])!;
        }
        
        if !priorityCase()
        {
            checkPriority(args: args);
        }
        
    }
	
	func priorityCase() -> Bool
	{
		switch mathOp 
		{
			case "+","-":
                return false;
			case "x","/","%","*":
				return true;
            default:
                return false;
            
		}
	}
	// operation function
	func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
	
	func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
	
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
	
	func divide(no1: Int, no2: Int)  -> Int {
        return no1 / no2;
    }
	
    func modulus(no1: Int, no2: Int)  -> Int{
        return no1 % no2;
    }
	
	func calculation() -> (current: Int?, point: Int)
	{
        if (mathOp == "/" || mathOp == "%"){
            if(secondNum == 0)
            {
                ErrorCheck().divisionByZero();
            }
        }
        
		switch mathOp 
		{
			case "+":
				currentResult = add(no1: firstNum, no2: secondNum);
			case "-":
				currentResult = subtract(no1: firstNum, no2: secondNum);
			case "x","*":
			    currentResult = multiply(no1: firstNum, no2: secondNum);
			case "/":
				currentResult = divide(no1: firstNum, no2: secondNum);
			case "%":
				currentResult = modulus(no1: firstNum, no2: secondNum);
			default:
				ErrorCheck().operatorNotRecognized();
		}
			return (currentResult, pointer);
	}
		
    
	func checkPriority(args:[String])    
	{
        while(pointer < args.count-3 && !priorityCase())
        {
          pointer+=2;// e.g 1+3+2  pointer to check the priority after number "3"
          firstNum = Int(args[pointer])!;//assigning first number, second number and operation to be checked on while loop
          secondNum = Int(args[pointer+2])!;
          mathOp = args[pointer+1];
        }
		
        if (pointer == args.count-3 && !priorityCase()) 
		{
            pointer = 0;//reset pointer
            firstNum = Int(args[0])!;
            secondNum = Int(args[2])!;
            mathOp = args[1];
        }
	}
	
    func calculate() -> Int 
	{
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
		var tempOp: [String] = args// to modify array by appending the unsolved math problem and already calculated math problem 
        var tempResult: (currentResult: Int?, position: Int) = (0, 0) // for answer of current operation
        while(tempOp.count > 2)//looping the calculator class to do calculation one by one
		{
            (tempResult.currentResult, tempResult.position) = Calculator(args: tempOp).calculation(); //looping the calculator class
			//when theres only one operation todo
            if (tempResult.position == 0 && tempOp.count == 3)
            {
                tempOp = ["\(tempResult.currentResult!)"]
            }            			
			else if (tempResult.position == 0 && tempOp.count > 3) //when priority on the left
			{
                tempOp = ["\(tempResult.currentResult!)"]  + Array(tempOp[tempResult.position + 3...tempOp.count - 1])
            }
			
            else if (tempResult.position > 0 && tempResult.position < tempOp.count-3)  //when priority on the middle
			{
                tempOp = Array(tempOp[0...tempResult.position - 1]) + ["\(tempResult.currentResult!)"] + Array(tempOp[tempResult.position + 3...tempOp.count - 1]);
            }
            else // priority on the right
			{
                tempOp =  Array(tempOp[0...tempResult.position-1]) + ["\(tempResult.currentResult!)"];
			}
		}
        return tempResult.currentResult!//force unwrapping to not check nil result
    }
}
