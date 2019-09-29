func fibonacci(_ number: Float64, memoizingDict: inout [Float64: Float64]) -> Float64 {
  switch number {
    case 0:
      return 0
    case 1:
      return 1
    default:
      let numberMinus1: Float64
      let numberMinus2: Float64
      if memoizingDict[number - 1] == nil {
        /// to perf test vs a non-memoized version
        // var dict: [Float64: Float64]  = [:]
        // let x = fibonacci(number - 1, memoizingDict: &dict)
        let x = fibonacci(number - 1, memoizingDict: &memoizingDict)
        memoizingDict[number - 1] = x
        numberMinus1 = x
      } else {
        numberMinus1 = memoizingDict[number - 1]!
      }

      if memoizingDict[number - 2] == nil {
        /// to perf test vs a non-memoized version
        // var dict: [Float64: Float64]  = [:]
        // let x = fibonacci(number - 2, memoizingDict: &dict)
        let x = fibonacci(number - 2, memoizingDict: &memoizingDict)
        memoizingDict[number - 2] = x
        numberMinus2 = x
      } else {
        numberMinus2 = memoizingDict[number - 2]!
      }
      return numberMinus1 + numberMinus2
  }
}

func fibonacci(_ number: Float64) -> Float64 {
  var dict: [Float64: Float64] = [:]
  return fibonacci(number, memoizingDict: &dict)
} 

print(fibonacci(1000))