import UIKit

// -> Comentario simple

/*
 Comentario multi linea
 */

// MARK: - TIPOS BÁSICOS
var nombre: String = "Pepe" // -> esta es una variable mutable como los de kotlin se copiaron
let apellido: String = "Ramirez" // -> esta es una variable inmutable

nombre = "Felipe"

let profesion = "iOs Developer"
print(profesion)

print("El Sr. \(nombre)" + " " + "\(apellido)")

var numeroA = 4
var numeroB = 3.8

var multiplicacion = Double(numeroA) * numeroB

var numeroC = 5
multiplicacion = multiplicacion + Double(numeroC)

var numeroH = 1, numeroG = 4.9, numeroL = 5
print(numeroG)

// MARK: - OPERADORES
var numeroD = 0
numeroD = 2 * 5 * 7

numeroD += 1
numeroD -= 10

var sino = false

if sino {
    debugPrint("Correcto")
} else {
    debugPrint("Incorrecto")
}

if nombre.isEmpty || apellido.isEmpty {
    
}

if numeroD >= 7 {
    
}

var resultado = numeroD != 0 ? numeroA / Int(numeroB) : 0

print(resultado)

// MARK: - CHARACTERS
var emptyString = ""
var anotherEmptyString = String()
var adios = "Adios"

emptyString.isEmpty
adios.isEmpty

var variableMutable = "Andres"
variableMutable += "Felipe"

for item in adios {
    print(item)
}

//MARK - Arrays

var iPhones = ["iPhone 4", "iPhone 5", "iPhone XR"]
var iPads = ["iPad Air", "iPad Mini"]

var dispositivos = iPhones + iPads

dispositivos.append("Mac Pro")
dispositivos.insert("Watch OS", at: 0)

//Ordeno por mayor número de caracteres
dispositivos.sort(by: >)

let iPhone = dispositivos[2]
var aux = dispositivos.filter { $0.contains("iP")}
print(aux)

// MARK: - Diccionarios

var diccionarioVacio: [String: Any] = [:]
var otroDiccionario = Dictionary<String, Any>() //Así se hacía antes

var coche = ["marca": "Mazda", "modelo": "Megane", "potencia": "145 caballos"]
let marca = coche["marca"]

if coche["modelo"] != nil {
    print(coche["modelo"]!)
}
//Igual que lo de arriba pero comprobando nulo con let
if let modelDes = coche["modelo"]{
    print(modelDes)
}

for (clave, valor) in coche {
    print("Clave \(clave) y el valor es \(valor)")
}

for clave in coche.keys{
    print(clave)
}

for valor in coche.values{
    print(valor)
}

// MARK: - Opcionales

var numeroEntero = 34
var numeroString = "3"

var sumatoria = numeroEntero + Int(numeroString)!

var nuevaSumatoria: String = "\(sumatoria)"

var nombreAA: String? = "Andres"
nombreAA = "Felipe"

var nombreBB: String? = nil
var nombreModA: String!

if let nombreDes = nombreModA {
    print(nombreDes)
}

// MARK: -Funciones

func miSerieFavoritaEs(){
    print("Juego de tronos")
}

miSerieFavoritaEs()

func funcionRetornaString() -> String {
    "Hola mundo"
}

funcionRetornaString()

func funcionConParametrosA(mensaje: String){
    print(mensaje)
}

func funcionConParametrosB(_ mensaje: String){
    print(mensaje)
}

//Para que se la variable parámetro tenga dentro distinto nombre que al invocar la función desde fuera
func funcionConParametrosC(mensaje withLabel: String){
    print(withLabel)
}

funcionConParametrosA(mensaje: "Hola Andres")
funcionConParametrosB("Hola Andres")
funcionConParametrosC(mensaje: "Hola Andres")

func numerosSecuenciaA (_ a: Int, _ b: Int, _ c: Int) -> Int{
    (a*b) + c
}

func numerosSecuenciaB (_ a: Int, b: Int, c: Int) -> Int{
    (a*b) + c
}

let auxDisA = numerosSecuenciaA(2, 3, 4)
let auxDisB = numerosSecuenciaB(2, b: 3, c: 4)
print(auxDisA)
print(auxDisB)

