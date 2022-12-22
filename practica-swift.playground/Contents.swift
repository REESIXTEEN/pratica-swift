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
    let tipo: String
    
    init(_ nombre:String = "", _ edad:Int = 0, _ tipo:String = ""){
        self.nombre = nombre
        self.edad = edad
        self.tipo = tipo
    }
}

enum tipoMiembro: String {
    case jugador = "Jugador"
    case seleccionador = "Seleccionador"
    case cuerpoTecnico = "Cuerpo técnico"
    case medico = "Médico"
    case utillero = "Utillero"
}


// MARK: ---------- Ejercicio 6 ----------

class Mundial {
    let selecciones: Array<Seleccion>
    let arbitros: Array<String>
    let pais: String
    let año: Int
    
    init(_ selecciones:Array<Seleccion> = [], _ arbitros:Array<String> = [], _ pais: String = "Catar", _ año:Int = 2022){
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
    
    init(_ nombre:String, _ pais:String, _ jugadores:Array<MiembroSeleccion>, _ seleccionador:MiembroSeleccion){
        self.nombre = nombre
        self.pais = pais
        self.jugadores = jugadores
        self.seleccionador = seleccionador
    }
}


// MARK: ---------- Ejercicio 7 ----------

class Partido {
    let local: Seleccion
    let visitante: Seleccion
    var resultado = (golesLocal:0,golesVisitante:0)
    
    init(_ local:Seleccion, _ visitante:Seleccion) {
        self.local = local
        self.visitante = visitante
    }
    
    func jugarPartido() {
        resultado.0 = Int.random(in: 0...10)
        resultado.1 = Int.random(in: 0...10)
    }
}

let jugador1: MiembroSeleccion = MiembroSeleccion("Messi", 34, tipoMiembro.jugador.rawValue)
let jugador2: MiembroSeleccion = MiembroSeleccion("Di Maria", 35, tipoMiembro.jugador.rawValue)
let jugador3: MiembroSeleccion = MiembroSeleccion("Pedri", 20, tipoMiembro.jugador.rawValue)
let jugador4: MiembroSeleccion = MiembroSeleccion("Gavi", 18, tipoMiembro.jugador.rawValue)
let jugador5: MiembroSeleccion = MiembroSeleccion("Mbappe", 23, tipoMiembro.jugador.rawValue)
let jugador6: MiembroSeleccion = MiembroSeleccion("Griezman", 31, tipoMiembro.jugador.rawValue)

let entrenador1: MiembroSeleccion = MiembroSeleccion("Scaloni", 40, tipoMiembro.seleccionador.rawValue)
let entrenador2: MiembroSeleccion = MiembroSeleccion("Luis Padrique", 53, tipoMiembro.seleccionador.rawValue)
let entrenador3: MiembroSeleccion = MiembroSeleccion("Deschamps", 54, tipoMiembro.seleccionador.rawValue)

let argentina:Seleccion = Seleccion("Argentina", "Argentina", [jugador1,jugador2],entrenador1)
let españa:Seleccion = Seleccion("España", "España", [jugador3,jugador4],entrenador2)
let francia:Seleccion = Seleccion("Francia", "Francia", [jugador5,jugador6],entrenador3)

let mundial: Mundial = Mundial([argentina,españa,francia],["Mateo", "Pepe"], "Catar", 2022)

var partidos: Array<Partido> = []

while partidos.count < 4 {
    var selecciones = mundial.selecciones
    selecciones = selecciones.shuffled()
    partidos.append(Partido(selecciones[0],selecciones[1]))
}

for partido in partidos{
    partido.jugarPartido()
    print("Partido: \(partido.local.nombre) \(partido.resultado.golesLocal) - \(partido.resultado.golesVisitante) \(partido.visitante.nombre)")
}


// MARK: ---------- Ejercicio 8 ----------


