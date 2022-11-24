import UIKit

var greeting = "Hello, playground"
class Persona{
    var nombre:String
    var paterno:String
    var materno:String
    var fecha:String
    var documento:String
    var sexo:String
    var correo:String
    var hermmanos:Int
    var usuario:String?
    
    init(nombre:String,paterno:String,materno:String,fecha:String,doc:String,sexo:String,correo:String,hermanos:Int,usuario:String?=nil){
        self.nombre=nombre
        self.paterno=paterno
        self.materno=materno
        self.fecha=fecha
        self.documento=doc
        self.sexo=sexo
        self.correo=correo
        self.hermmanos=hermanos
        self.usuario=usuario
    }
    
    
}


var arrayPerson =  [Persona]()


let persona1=Persona(nombre: "CARLOS JOSÉ", paterno: "ROBLES", materno: "GOMES", fecha:"06/08/1995", doc: "78451245", sexo: "m", correo: "carlos.roblesg@hotmail.com", hermanos: 2)

let persona2=Persona(nombre: "MIGUUEL ANGEL", paterno: "QUISPE", materno: "OTERO", fecha: "28/12/1995", doc: "79451654", sexo: "m", correo: "miguel.anguel@gmail.com", hermanos: 0)


let persona3=Persona(nombre: "KARLA ALEXANDRA", paterno: " FLORES", materno: "ROSAS", fecha: "15/02/1997", doc: "77485812", sexo: "f", correo: "Karla.alexandra@hotmail.com", hermanos: 1 )


let persona4=Persona(nombre: "NICOLAS", paterno: "QUISPE", materno: "ZEBALLOS", fecha: " 08/10/1990", doc: "71748552", sexo: "m", correo: "nicolas123@gmail.com", hermanos: 1 )


let persona5=Persona(nombre: "PEDRO ANDRE", paterno: "PICASSO", materno: "BETANCUR", fecha: "17/05/1994", doc: "74823157", sexo: "m", correo: "pedroandrepicasso@gmail.com", hermanos: 2)


let persona6=Persona(nombre: "FABIOLA MARIA", paterno: "PALACIO", materno: "VERA", fecha: "02/02/1992", doc: "76758254", sexo: "f", correo: "fabi@hotmail.com", hermanos: 0)


arrayPerson.append(persona1)
arrayPerson.append(persona2)
arrayPerson.append(persona3)
arrayPerson.append(persona4)
arrayPerson.append(persona5)
arrayPerson.append(persona6)




let arrayFem=arrayPerson.filter{$0.sexo=="f"}

let arrayHom=arrayPerson.filter{$0.sexo=="m"}

let arrayBro=arrayPerson.filter{$0.hermmanos>2}


print("cantidad de mujeres: \(arrayFem.count)")

print("cantidad de hombres: \(arrayHom.count)")

print("cantidad de personas con mas de 2 hermanos: \(arrayBro.count)")

//nombre mujeres
/*for persona in arrayFem {
    print(persona.nombre)
}
//nombre varones
for persona in arrayHom {
    print(persona.nombre)
}

//con mas de dos hermanos
for persona in arrayBro {
    print(persona.nombre)
    
}*/


func fechaNacimiento(_ fechaNacimiento:String) ->Date {
    
    let feNacString=fechaNacimiento
    let dateFormat=DateFormatter()
    dateFormat.dateFormat="dd/MM/yy"
    let fe = dateFormat.date(from: feNacString)
    return fe!

    
}


func calcularEdad(_ fechaNac:String) -> Int {
    
    let fecNacDate=fechaNacimiento(fechaNac)

    let date=Date()

    let calendar=Calendar.current
    let newDateOld=calendar.dateComponents( [.day, .month, .year], from:fecNacDate)
    let newDateNow=calendar.dateComponents( [.day, .month, .year], from:date)
    let starDate=DateComponents(year:newDateOld.year,month: newDateOld.month,day: newDateOld.day)
    let endDate=DateComponents(year:newDateNow.year,month: newDateNow.month,day: newDateNow.day)
    let resultYears=calendar.dateComponents( [.year], from: starDate, to: endDate)

    return resultYears.year ?? 0

    
}




 func buscarMayorEdad() -> String{
    
    var mayor=0
    var nombre:String?=nil
     for persona in arrayPerson {
        
         var edad=calcularEdad(persona.fecha)
         if mayor < edad{
             mayor = edad
             nombre=persona.nombre
         }

    }
    
    return nombre ?? "nadie"
    
}

func buscarMenorEdad() -> String{
   
   var mayor=999
   var nombre:String?=nil
    for persona in arrayPerson {
      
        var edad=calcularEdad(persona.fecha)
        if mayor > edad{
            mayor = edad
            nombre=persona.nombre
        }

   }
   
   return nombre ?? "nadie"
   
}

//mayor edad
let mayor=buscarMayorEdad()

//menor edad
let menor=buscarMenorEdad()
print("la persona con mayor edad es:\(mayor)")
print("la persona con menor edad es:\(menor)")

//formato de las personas
for persona in arrayPerson {
    
    let nom=persona.nombre.components(separatedBy: " ").first
    
    if nom != nil {
        let nomIni=nom!.prefix(1).capitalized
        let nomResto=nom!.dropFirst().lowercased()
        let nombre=nomIni+nomResto
        let paIni=persona.paterno.prefix(1).capitalized
        let paResto=persona.paterno.dropFirst().lowercased()
        let paterno=paIni+paResto
        let maIni=persona.materno.prefix(1).capitalized
        let materno=maIni+"."
        print(nombre+" "+paterno+" "+materno)
        
    }
   
   
   
}

for persona in arrayPerson {
    
    let usuario=persona.correo.components(separatedBy: "@").first
    
    if usuario != nil {
        persona.usuario=usuario!
        
    }

}


for persona in arrayPerson {
    
    print("nombre: " + persona.nombre + " correo: " + persona.correo+" usuario: "+(persona.usuario ?? " "))

}



