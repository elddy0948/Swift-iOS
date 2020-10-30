#  Concurrency Practice

Concurrency ==> 동시성
멀티 태스킹을 위해 여러개의 스레드가 서로 번갈아가면서 실행되어 마치 동시에 여러 작업을 하는 것 처럼 보이게 한다.


Operation을 사용하여 실행하고 싶은 작업을 정의.

````

class CalculatePrimeOperation: Operation {
    override func main() {
        for number in 0...1_000_000 {
            let isPrimeNumber = isPrime(number: number)
            print("\(number) is Prime : \(isPrimeNumber)")
        }
    }
    func isPrime(number: Int) -> Bool {
        if number <= 1 { return false }
        if number <= 3 {return true }
        
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}


````


qos => 중요도 
qos를 지정함으로서 시스템이 우선순위를 정하고 이에 따라 스케쥴링을 정한다.

sync => 큐에 작업을 추가하면 그것이 끝날 때 까지 대기.
async => 큐에 작업을 추가하면 다른 작업을 할 수 있음

````
DispatchQueue.global(qos: .userInitiated).async {
    for number in 0...1_000_000 {
        let isPrimeNumber = self.isPrime(number: number)
        print("\(number) is Prime : \(isPrimeNumber)")
    }
    self.myButton.isEnabled = true
}

````
