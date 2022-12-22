import Cocoa

// MARK: ---------- Ejercicio 1 ----------

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


// MARK: ---------- Ejercicio 2 ----------

var sum50 = 0
for num in primes.prefix(10){
    sum50 += num
}
print(sum50)


// MARK: ---------- Ejercicio 3 ----------

var players: [String] = ["Vinicius", "Messi", "Ronaldo", "Pedri", "Mbappe", "Modric", "Militao", "Morata", "Valverde", "Benzema", "Piqué" ]
let vowels = "aeiou"

let playersVowels = players.filter({$0.filter({vowels.contains($0)}).count > 2})


// MARK: ---------- Ejercicio 4 ----------

enum PlayerPosition: String {
    case portero = "Portero"
    case lateralDerecho = "Lateral derecho"
    case central = "Central"
    case lateralIzquierdo = "Lateral izquierdo"
    case medioCentro = "Medio centro"
    case extremoDerecho = "Extremo derecho"
    case extremoIzquierdo = "Extremo izquierdo"
    case delantero = "Delantero"
}

// MARK: ---------- Ejercicio 5 ----------

class MiembroSeleccion {
    let nombre: String
    let edad: Int
    enum tipo: String {
        case jugador = "Jugador"
        case seleccionador = "Seleccionador"
        case cuerpoTecnico = "Cuerpo técnico"
        case medico = "Médico"
        case utillero = "Utillero"
    }
    
    init(nombre:String = "",edad:Int = 0){
        self.nombre = nombre
        self.edad = edad
    }
}




// MARK: ---------- Ejercicio 6 ----------

class Mundial {
    let selecciones: Array<Seleccion>
    let arbitros: Array<String>
    let pais: String
    let año: Int
    
    init(selecciones:Array<Seleccion> = [], arbitros:Array<String> = [], pais: String = "Catar", año:Int = 2022){
        self.selecciones = selecciones
        self.arbitros = arbitros
        self.pais = pais
        self.año = año
    }
}

class Seleccion {
    let nombre: String
    let pais: String
    let jugadores: Array<MiembroSeleccion>
    let seleccionador: MiembroSeleccion
    
    init(nombre:String, pais:String, jugadores:Array<MiembroSeleccion>, seleccionador:MiembroSeleccion){
        self.nombre = nombre
        self.pais = pais
        self.jugadores = jugadores
        self.seleccionador = seleccionador
    }
}


