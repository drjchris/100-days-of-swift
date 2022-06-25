import Foundation

// structrure for edges
struct graphEdge{
    let nodeFrom: Int
    let nodeTo: Int
}

struct graphNode {
    let nodeId: Int
    let nodeLabel: String
}


// local path for the file
let theFileDir = "data.txt"

// open as string
let fileCont = try! String(contentsOfFile: theFileDir)

// split by end of each line
let txtLines = fileCont.split(separator: "\n")

// declare list of nodes
var listNodes: [String] = []

// declare list of edges
var listEdges: [(String, String)] = []


// split each link by tab
for eachEdge in txtLines{
    
    let nodeList = eachEdge.split(separator: "\t")
    
    // append the edges
    listEdges.append((String(nodeList[0]), String(nodeList[1])))
   
    // now append the nodes - but not duplicates
    for eachNode in nodeList{
        
        // check if node has already been used
        if listNodes.contains(String(eachNode))==false{
            listNodes.append(String(eachNode))
        } else {
            //
        }
        //print(type(of: eachNode))
    }
}

// create ids for all the nodes
var nodeIds: [String: Int] = [:]

// pass all the nodes to a graphNode structure
var listNodeStructs: [graphNode] = []

// sort the node list alphabetically
let sorNodeList = listNodes.sorted()

for i in 0...sorNodeList.count-1{
    let eachNode = graphNode(nodeId: i, nodeLabel: sorNodeList[i])
    listNodeStructs.append(eachNode)
    nodeIds[sorNodeList[i]] = i
}

// pass all the edges to a graphEdge structure
var listEdgeStructs: [graphEdge] = []

// replace names with ids
for eachEdge in listEdges{
    let ifrom = nodeIds[eachEdge.0]
    let ito = nodeIds[eachEdge.1]
    let eachEdge = graphEdge(nodeFrom: ifrom!, nodeTo: ito!)
    listEdgeStructs.append(eachEdge)
}

print("graph\n[")
for everyNode in listNodeStructs{
    let outputNode = """
    node
    [
        id \(everyNode.nodeId)
        label \"\(everyNode.nodeLabel)\"
    ]
"""
    print(outputNode)
}
for everyEdge in listEdgeStructs{
    let outputEdge = """
    edge
    [
        source \(everyEdge.nodeFrom)
        target \(everyEdge.nodeTo)
    ]
"""
    print(outputEdge)
}
print("]")

