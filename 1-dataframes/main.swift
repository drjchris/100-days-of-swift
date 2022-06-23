//
//  main.swift
//  100-days-of-swift
//
//  Created by Jose Christian on 23/06/2022.
//

// DAY 1 - Counting Values and making a DataFrame

import Cocoa
import TabularData
import Foundation

// String array
let myStringArray = [
    "pers1","pers1","pers1","pers1","pers1","pers1","pers1","pers1","pers1","pers1","pers1",
    "pers2","pers2","pers2","pers2","pers2","pers2","pers2","pers2","pers2",
    "pers3","pers3","pers3","pers3","pers3",
    "someone","someone","someone",
    "else"
]

// Int array
let myIntArray = [
    1,1,1,1,1,1,1,1,1,1,1,
    2,2,2,2,2,2,2,2,2,
    3,3,3,3,3,
    4,4,4,
    5
]

// This function does the count and outputs a dataframe
func countValues(theRawArray: [AnyHashable]) -> DataFrame{
    
    // declare empty dictionary for count
    var outDict: Dictionary <AnyHashable, Int> = [:]
    
    // go through each of the values and count them
    for eitem in theRawArray{
        if outDict[eitem]==nil{
            outDict[eitem]=1
        } else {
            outDict[eitem]!+=1
        }
    }
  
    // declare arrays from keys and values
    var theKeys: Array<Any> = []
    var theVals: Array<Any> = []
   
    // pass from dictionary to seperate arrays
    for eItem in outDict{
        theKeys.append(eItem.key)
        theVals.append(eItem.value)
    }
 
    // make the dataframe and use the arrays to creat the columns
    let theDF: DataFrame = [
        "values": theKeys,
        "count": theVals
    ]
  
    // return the dataframe
    return theDF
}

// pass both arrays through function
var strDf = countValues(theRawArray: myStringArray)
let intDf = countValues(theRawArray: myIntArray)

// create a new column to add to one of the dataframes
let newCol = Column(name: "Something", contents: [5,4,3,2,1])

// add column to the dataframe
strDf.append(column: newCol)

// print output
print(strDf)
print(intDf)

