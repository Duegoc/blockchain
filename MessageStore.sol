//Este Smart contract o el contrato esta diseñado 
//Para poder almacenar un mensaje y devolverselo al usuario 
//que lo solicite 


//Version de solidity  que vamos a utilizar 
pragma solidity ^0.4.24;

//Empezamos a crear el Smart contract
//Utilizaremos la palabra contract y el nombre
contract MessageStore{

    //Para poder almacenar quien es el propietario del contrato  
    //utilizamos la variable address el tipo y el nombre 
    address private owner;
    
    //Para almacenar un mensaje 
    //definimos una variable de tipo string 
    string private message;
    
    //Definimos un constructor con la misma palabra
    constructor () public {
        
        //Para almacenar quien es el propietario del contrato 
        //Asignamos la variable a msg.sender
        owner = msg.sender;
    }
    
    //funcion recibe el parametro de tipo string y va a hacer publico 
    function setMessage (string newMessage) public isOwner{
        //message es una variable 
        message = newMessage;
    }
    
    //funcion que envia un mensaje 
    //view indica no guardar nada en la variable 
    function getMessage () public view returns(string){
        return message;
    }
    
    //iniciamos el modificador personalizado 
    modifier isOwner (){
        require(owner == msg.sender);
        _;
    }
}