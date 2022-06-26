import Foundation

// import the relevant library
import TabularData

/*
    OPEN LOCAL CSV FILE
*/

// local path for the file
let theFileDir = "table.csv"

// convert string directory to url
let fileUrl = URL(fileURLWithPath: theFileDir)

// pass on the options for the csv
let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")

// declare column types
let columnTypes: [String: CSVType] = ["val": .string, "cou": .integer]

// read file into dataframe
var mainDf = try DataFrame(contentsOfCSVFile: fileUrl, columns: ["val", "cou"], types:columnTypes, options: options)

/*
    CALCULATE NEW COLUMN
*/

// sum of the "cou" column
// surely there must be a better way
var colCounts: [Int] = []
for theInt in mainDf.cou {
    colCounts.append(theInt as! Int)
}
let couSum = colCounts.reduce(0,+)

// calculate percentages for new column
var listPers: [Float] = []
for eachInt in colCounts{
    listPers.append(Float(eachInt)/Float(couSum))
}

/*
     CREATE A NEW COLUMN WITH THE PER DATA
 */

// create a new columns
var newColumn = Column(name: "per", contents: listPers)

// append the new column to
mainDf.append(column: newColumn)

/*
    WRITE THE DATAFRAME TO A CSV FILE
 */

// local path for the output file
let theOutFileDir = "mynewtable.csv"

// convert output string directory to url
let fileOutUrl = URL(fileURLWithPath: theOutFileDir)

// dataframe write to csv
try mainDf.writeCSV(to: fileOutUrl)

// print the table, just because
print(mainDf)

