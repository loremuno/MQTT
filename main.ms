//Definimos el modelo que se utilizara para conectar Mosquitto y publicar o suscribirse a mensajes
//En este caso solo tiene dos parametros numericos de tipo Double
Model Info{
    Double temp
    Double hum
}

Application {
    String stateChannel
    Main m
    //Cuando se inicia la aplicacion se setean valores por defecto en distintas variables
    OnInit {
        //Esta variable es la que se utiliza para suscribirse o publicar en un topico con Mosquitto
        //Se debe tener en cuenta para cuando se crea el canal asincrono, ya que el canal debe llevar el mismo nombre
        stateChannel = "home"
        m = Main()
        broker.ui.push("Main",m)
        sensorControllerModule.initialize()
    }
}

Entry Experience Main {
    //Se declaran las variables que se van a renderizar en la vista. En este caso son todos Label con distintos valores por defecto
    String desc1Lbl value("Temperatura:") as Label
    String tempLbl value("Temp") as Label
    String desc2Lbl value("Humedad:") as Label
    String humLbl value("Hum") as Label
    String desc4Lbl value("Última actualización:") as Label
    Date date as Label 
}

Module sensorControllerModule{
    void initialize(){
        try{
            //Se inicializa la conexion al broker
            broker.async.initialize()
            broker.async.connect()
            //Suscribimos el canal creado para la comunicacion con Mosquitto
            broker.async.subscribe(stateChannel,@function(Subscriptors.handler))
        }catch(e){
            //Si hay un problema en la conexion se muestra un mensaje de excepcion en la App
            broker.async.disconnect()
            broker.ui.showAlert("Exception : "+e.name(), "Description: " + e.reason())
        }   
    }
}

Module Subscriptors{
    //Metodo que va a manejar los mensajes que lleguen de Mosquitto
    //Se declara el modelo a utilizar
    void handler(Info data){
        //Si el JSON pasado desde mosquitto es distinto del que se necesita entonces tira error
        if(data!=null){
            //se imprimen los valores en la UI
            m.tempLbl = data.temp.toString() + " °C" 
            m.humLbl = data.hum.toString() + " %"
            m.date = Date()
        
        }else {
          //error al conectar o reconectar un dispositivo.
          broker.ui.showAlert("DEBUG", "Info es null")
        }
    }
}