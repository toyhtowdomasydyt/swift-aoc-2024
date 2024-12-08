//
//  Day02.swift
//  AdventOfCode
//
//  Created by Nazarii Dzhaliuk on 07.12.2024.
//

import Algorithms

enum Direction {
  case ASC
  case DESC
}

struct Day02: AdventDay {
  var data: String
  
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ")
    }.map {
      $0.compactMap {
        Int($0)
      }
    }
  }
  
  func part1() -> Int {
    var safeCount = 0
    
    for levels in entities {
      let differances = zip(levels, levels.dropFirst()).map {
        $0.0 - $0.1
      }
      
      if let first = differances.first {
        let sign = first.signum()
        let max: Int
        let min: Int
        
        if sign < 0 {
           max = -1
           min = -3
        } else {
           max = 3
           min = 1
        }
        
        let safe = differances.allSatisfy { $0.signum() == sign && $0 >= min && $0 <= max }

        if safe {
          safeCount += 1
        }
      }
    }
    
    return safeCount
  }
  
  func part2() -> Int {
    var safeCount = 0
    
    for levels in entities {
      let differances = zip(levels, levels.dropFirst()).map {
        $0.0 - $0.1
      }
      
      if let first = differances.first {
        let sign = first.signum()
        let max: Int
        let min: Int
        
        if sign < 0 {
           max = -1
           min = -3
        } else {
           max = 3
           min = 1
        }
        
        let filteredDifferances = differances.filter { $0.signum() == sign && $0 >= min && $0 <= max }
        let offDifference = Set(differances).subtracting(Set(filteredDifferances))
        
        if (offDifference.count == 1) {
          if let first = offDifference.first {
            if abs(first) <= 3 && abs(first) >= 0 || first == differances.last {
              safeCount += 1
            }
          }
        } else if (offDifference.count == 0) {
          safeCount += 1
        }
      }
    }
    
    return safeCount
  }
}
