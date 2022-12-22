import Cocoa

// MARK: -- Ejercicio 1 --

var primes: Array<Int> = []

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

var num = 0
while primes.count < 100{
    if (isPrime(num)){
        primes.append(num)
    }
    num+=1
}

print(primes.suffix(10))


// MARK: -- Ejercicio 2 --


