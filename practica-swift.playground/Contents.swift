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
    
    //  -- ejercicio 8 --
    var grupos: Array<Grupo> = []
    
    func establecerGrupos() {
        let tamañoGrupo = 4
        var seleccionesSorteo = selecciones.shuffled()
        let nombresGrupos = ["A","B","C","D","E","F","G","H"]
        for nombre in nombresGrupos where seleccionesSorteo.count > 0 {
            var seleccionesGrupo = Array(seleccionesSorteo.prefix(tamañoGrupo))
            seleccionesSorteo.removeFirst(tamañoGrupo)
            var grupo = Grupo("Grupo \(nombre)", seleccionesGrupo)
            grupos.append(grupo)
        }
    }
}

class Seleccion {
    let nombre: String
    let pais: String
    let jugadores: Array<MiembroSeleccion>
    let seleccionador: MiembroSeleccion
    var puntosTotales: Int = 0
    
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
    var resultadoGoles = (golesLocal:0,golesVisitante:0)
    var resultado = ""
    
    init(_ local:Seleccion, _ visitante:Seleccion) {
        self.local = local
        self.visitante = visitante
    }
    
    func jugarPartido() {
        resultadoGoles.0 = Int.random(in: 0...10)
        resultadoGoles.1 = Int.random(in: 0...10)
        switch resultadoGoles{
        case let(l,v) where (l > v):
            resultado = local.nombre
        case let(l,v) where (l < v):
            resultado = visitante.nombre
        default:
            resultado = "empate"
        }
        
    }
}

let jugador1: MiembroSeleccion = MiembroSeleccion("Messi", 34, tipoMiembro.jugador.rawValue)
let jugador2: MiembroSeleccion = MiembroSeleccion("Di Maria", 35, tipoMiembro.jugador.rawValue)
let jugador3: MiembroSeleccion = MiembroSeleccion("Pedri", 20, tipoMiembro.jugador.rawValue)
let jugador4: MiembroSeleccion = MiembroSeleccion("Gavi", 18, tipoMiembro.jugador.rawValue)
let jugador5: MiembroSeleccion = MiembroSeleccion("Mbappe", 23, tipoMiembro.jugador.rawValue)
let jugador6: MiembroSeleccion = MiembroSeleccion("Griezman", 31, tipoMiembro.jugador.rawValue)
let jugador7: MiembroSeleccion = MiembroSeleccion("Vini", 20, tipoMiembro.jugador.rawValue)
let jugador8: MiembroSeleccion = MiembroSeleccion("Neymar", 31, tipoMiembro.jugador.rawValue)
let jugador9: MiembroSeleccion = MiembroSeleccion("Modric", 37, tipoMiembro.jugador.rawValue)
let jugador10: MiembroSeleccion = MiembroSeleccion("Perisisc", 33, tipoMiembro.jugador.rawValue)
let jugador11: MiembroSeleccion = MiembroSeleccion("Pedro", 24, tipoMiembro.jugador.rawValue)
let jugador12: MiembroSeleccion = MiembroSeleccion("Julian", 32, tipoMiembro.jugador.rawValue)
let jugador13: MiembroSeleccion = MiembroSeleccion("Van Dik", 26, tipoMiembro.jugador.rawValue)
let jugador14: MiembroSeleccion = MiembroSeleccion("De Jon", 26, tipoMiembro.jugador.rawValue)
let jugador15: MiembroSeleccion = MiembroSeleccion("Carter", 20, tipoMiembro.jugador.rawValue)
let jugador16: MiembroSeleccion = MiembroSeleccion("Rupert", 31, tipoMiembro.jugador.rawValue)

let entrenador1: MiembroSeleccion = MiembroSeleccion("Scaloni", 40, tipoMiembro.seleccionador.rawValue)
let entrenador2: MiembroSeleccion = MiembroSeleccion("Luis Padrique", 53, tipoMiembro.seleccionador.rawValue)
let entrenador3: MiembroSeleccion = MiembroSeleccion("Deschamps", 54, tipoMiembro.seleccionador.rawValue)
let entrenador4: MiembroSeleccion = MiembroSeleccion("Tite", 54, tipoMiembro.seleccionador.rawValue)
let entrenador5: MiembroSeleccion = MiembroSeleccion("Moldivic", 46, tipoMiembro.seleccionador.rawValue)
let entrenador6: MiembroSeleccion = MiembroSeleccion("Santiago", 50, tipoMiembro.seleccionador.rawValue)
let entrenador7: MiembroSeleccion = MiembroSeleccion("Van Gahl", 68, tipoMiembro.seleccionador.rawValue)
let entrenador8: MiembroSeleccion = MiembroSeleccion("John", 37, tipoMiembro.seleccionador.rawValue)

let argentina:Seleccion = Seleccion("Argentina", "Argentina", [jugador1,jugador2],entrenador1)
let españa:Seleccion = Seleccion("España", "España", [jugador3,jugador4],entrenador2)
let francia:Seleccion = Seleccion("Francia", "Francia", [jugador5,jugador6],entrenador3)
let brasil:Seleccion = Seleccion("Brasil", "Brasil", [jugador7,jugador8],entrenador4)
let croacia:Seleccion = Seleccion("Croacia", "Croacia", [jugador9,jugador10],entrenador5)
let ecuador:Seleccion = Seleccion("Ecuador", "Ecuador", [jugador11,jugador12],entrenador6)
let holanda:Seleccion = Seleccion("Holanda", "Holanda", [jugador13,jugador14],entrenador7)
let australia:Seleccion = Seleccion("Australia", "Australia", [jugador15,jugador16],entrenador8)

let mundial: Mundial = Mundial([argentina,españa,francia,brasil,croacia,ecuador,holanda,australia],["Mateo", "Pepe"], "Catar", 2022)

// generar unos partidos aleatorios y mostrar su resultado
var partidos: Array<Partido> = []

while partidos.count < 4 {
    var selecciones = mundial.selecciones
    selecciones = selecciones.shuffled()
    partidos.append(Partido(selecciones[0],selecciones[1]))
}

for partido in partidos{
    partido.jugarPartido()
    print("Partido: \(partido.local.nombre) \(partido.resultadoGoles.golesLocal) - \(partido.resultadoGoles.golesVisitante) \(partido.visitante.nombre)")
}


// MARK: ---------- Ejercicio 8 ----------

class Grupo {
    let nombre: String
    let participantes: Array<Seleccion>
    var partidos: Array<Partido> = []
    
    init(_ nombre:String = "", _ participantes:Array<Seleccion> = []) {
        self.nombre = nombre
        self.participantes = participantes
    }
    
    func resumen() {
        print("----- \(nombre) -----")
        participantes.forEach({print($0.nombre)})
    }
    
    func establecerPartidos() {
        for index in 0..<participantes.count {
            for n in index..<participantes.count-1{
                var partido = Partido(participantes[index],participantes[n+1])
                partidos.append(partido)
            }
            
        }
    }
    
    // --- ejercicio 9 ---
    func obtenerPuntos(seleccion:Seleccion){
        var puntosTotales = 0
        var partidosJugados = partidos.filter({$0.local.nombre == seleccion.nombre || $0.visitante.nombre == seleccion.nombre})
        for partido in partidosJugados{
            switch partido.resultado{
            case seleccion.nombre:
                puntosTotales += 3
            case "empate":
                puntosTotales += 1
            default:
                puntosTotales += 0
            }
        }
        seleccion.puntosTotales = puntosTotales
    }
    
}


/* --- Añadido a la clase Mundial ---
 var grupos: Array<Grupo> = []
 
 func establecerGrupos() {
     let tamañoGrupo = 4
     var seleccionesSorteo = selecciones.shuffled()
     let nombresGrupos = ["A","B","C","D","E","F","G","H"]
     for nombre in nombresGrupos where seleccionesSorteo.count > 0 {
         var seleccionesGrupo = Array(seleccionesSorteo.prefix(tamañoGrupo))
         seleccionesSorteo.removeFirst(tamañoGrupo)
         var grupo = Grupo("Grupo \(nombre)", seleccionesGrupo ,[])
         grupos.append(grupo)
     }
 }
 */

mundial.establecerGrupos() //establecer grupos de forma aleatoria
mundial.grupos.forEach({$0.resumen()})  // mostrar los grupos creados
mundial.grupos.forEach({$0.establecerPartidos()}) // establecer los partidos de cada grupo
mundial.grupos.forEach({$0.partidos.forEach({$0.jugarPartido()})}) // jugar los partidos de cada grupo


// MARK: ---------- Ejercicio 9 ----------

/* --- Añadido a la clase Grupo ---
 func obtenerPuntos(seleccion:Seleccion){
     var puntosTotales = 0
     var partidosJugados = partidos.filter({$0.local.nombre == seleccion.nombre || $0.visitante.nombre == seleccion.nombre})
     for partido in partidosJugados{
         switch partido.resultado{
         case seleccion.nombre:
             puntosTotales += 3
         case "empate":
             puntosTotales += 1
         default:
             puntosTotales += 0
         }
     }
     seleccion.puntosTotales = puntosTotales
 }
 */


// MARK: ---------- Ejercicio 10 ----------

// calcular los puntos obtenidos por todas las selccinoes en cada grupo
mundial.grupos.forEach({grupo in
    grupo.participantes.forEach({grupo.obtenerPuntos(seleccion:$0)})
})

//obtener los dos primeros clasificados de cada grupo
mundial.grupos.forEach({grupo in
    var clasificadas = grupo.participantes.sorted{$0.puntosTotales > $1.puntosTotales}.prefix(2)
    print("\(grupo.nombre) : 1º \(clasificadas[0].nombre) (\(clasificadas[0].puntosTotales) puntos)  2º \(clasificadas[1].nombre) (\(clasificadas[1].puntosTotales) puntos) ")
})

