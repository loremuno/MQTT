//En el caso que querramos declarar Modelos que se puedan utilizar a lo largo del codigo, se pueden hacer en este archivo models.ms
//Si o si el archivo debe tener el nombre models.ms

//Ejemplo de Modelo
Model Command{ 
    String command
    Integer relayIdx 
}

//Ejemplo de Modelo
Model Bulb {
    Bool state
    String imagePath
}