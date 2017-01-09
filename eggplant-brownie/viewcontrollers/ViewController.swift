//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 09/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet
    var nameField : UITextField!;
    
    @IBOutlet
    var happinessField : UITextField!;
    
    
    @IBAction
    func add(){
        //Declaracao de variavel implicita  var teste = "TESTE VARIAVEL IMPLICITA"
        //No swift não é obrigatório colocar ; no final da linha, caso seja executado somente aquele comando... NO caso de 2 ou mais comandos sendo executado na mesma linha deve-se incluir o ;
        //LET é uma constante do swift
        let name = nameField.text
        //Declaração de variavel explicita var teste:String = "Teste Variavel Explicita"
        let happiness=happinessField.text
        print("eaten \(name) whith happiness \(happiness)")
    
    }

}

