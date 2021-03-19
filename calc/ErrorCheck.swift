//
//  ErrorChecker.swift
//  calc
//
//  Created by Pattrick Matthew Hartono on 17/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

//reference https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html

struct  ErrorCheck //for throwing error
{
    enum CalculatorError: Error
    {
        case validity;
        case operatorNotRecognized;
        case divisionByZero;
    }
    

func validity()
    {
    do
    {
    throw CalculatorError.validity;
    } catch
        {
        print("your input is not valid");
        exit(404);
        }
    }
func operatorNotRecognized()
    {
    do
    {
        throw CalculatorError.operatorNotRecognized;
    } catch
        {
            print("operator is not recognized. hint:only use +,-,x,*,/,%");
            exit(404);
        }
    }
func divisionByZero()
{
    do
    {
     throw CalculatorError.divisionByZero;
    } catch
        {
            print("divided by zero error");
            exit(404);
        }
    }
}

