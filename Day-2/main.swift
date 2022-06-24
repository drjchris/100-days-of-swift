//
//  main.swift
//  100-days-of-swift
//
//  Created by Jose Christian on 24/06/2022.
//

// Day two - Creating a structure and parsing some json

import Foundation

// local path for the file
let theFileDir = "data.json"

// The structure where the json data will go
struct personel: Codable{
        let name: String
        let surname: String
        let age: Int
        let occupation: String
}

// in case we get errors
do {
    
    // reads the content of file as string
    let fileString = try String.init(contentsOfFile: theFileDir)
    // transforms it to data
    let jsonData = fileString.data(using: .utf8)!
    // places data into an array of personel structure and output JSON
    let pEnt: [personel] = try! JSONDecoder().decode([personel].self, from: jsonData)
   
    // it's all now ready to use
    print("\(pEnt[0].name) and \(pEnt[1].name) are both part of the \(pEnt[0].surname) family.")
    print("\(pEnt[1].name) is \(pEnt[1].age), while \(pEnt[0].name) is \(pEnt[0].age).")
    print("\(pEnt[1].name) \(pEnt[1].surname) is the \(pEnt[1].occupation), while his son is a freaking \(pEnt[0].occupation)!")
    
} catch {
    print(error.localizedDescription)
}

