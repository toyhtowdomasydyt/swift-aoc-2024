import Algorithms

struct Day01: AdventDay {
  var data: String

  var entities: ([Int], [Int]) {
    data.split(separator: "\n").map {
      $0.split(separator: "   ")
    }.map {
      $0.compactMap {
        Int($0)
      }
    }.reduce(into: ([Int](), [Int]())) {
      result, pair in
      result.0.append(pair[0])
      result.1.append(pair[1])
    }
  }

  func part1() -> Any {
    var (firstColumn, secondColumn) = entities
    firstColumn.sort()
    secondColumn.sort()

    let sortedColumns = Array(zip(firstColumn, secondColumn))
    let distances = sortedColumns.map {
      abs($0 - $1)
    }

    let sum = distances.reduce(0, +)

    return sum
  }
  
  func part2() -> Any {
    let (firstColumn, secondColumn) = entities
    var totalSimilarityScore = 0
    
    for id in firstColumn {
      let currentAmount = secondColumn.count(where: {
        $0 == id
      })
      let currentSimilarityScore = id * currentAmount
      
      totalSimilarityScore += currentSimilarityScore
    }
    
    return totalSimilarityScore
  }
}
