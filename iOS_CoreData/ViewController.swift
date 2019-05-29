//
//  ViewController.swift
//  iOS_CoreData
//
//  Created by Benjamim on 28/05/19.
//  Copyright © 2019 Benjamim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var delegate: AppDelegate?
    //MARK: - Properties
    //MARK: TextFields
    @IBOutlet weak var addPais: UITextField!
    @IBOutlet weak var addCidade: UITextField!
    @IBOutlet weak var especPais: UITextField!
    @IBOutlet weak var cidade: UITextField!
    @IBOutlet weak var pais: UITextField!
    @IBOutlet weak var paisAntigo: UITextField!
    @IBOutlet weak var paisNovo: UITextField!
    //MARK: Labels
    @IBOutlet weak var paisCidade: UILabel!
    @IBOutlet weak var cidadePais: UITextField!
    @IBOutlet weak var final: UILabel!
    //MARK: Actions
    
    @IBAction func adicionarPais(_ sender: Any) {
        Pais.insert(nome: addPais.text!, appDel: delegate!)
        addPais.text = ""
    }
    @IBAction func removerPais(_ sender: Any) {
        Pais.delete(nome: addPais.text!, appDel: delegate!)
    }
    @IBAction func adicionarCidade(_ sender: Any) {
        Cidade.insert(nome: addCidade.text!, nomePais: especPais.text!, populacao: 1000, appDel: delegate!)
        addCidade.text = ""
        especPais.text = ""
    }
    @IBAction func bPaisCidade(_ sender: Any) {
        if let c:Cidade = Cidade.getByNome(nome: cidade.text!, appDel: delegate!) {
            paisCidade.text = c.temPais?.nome
        } else {
            paisCidade.text = "Cidade n existe"
        }
    }
    @IBAction func bCidadePais(_ sender: Any) {
        if let p:Pais = Pais.getByNome(nome: pais.text!, appDel: delegate!) {
            var result:String = ""
            print(p.temCidade!.count)
            for c in p.temCidade! as! Set<Cidade> {
                result = result + c.nome!
                print(c.nome!)
            }
            paisCidade.text = result
        } else {
            paisCidade.text = "Nao ha"
        }
    }
    @IBAction func atualizar(_ sender: Any) {
        Pais.update(nomeAntigo: paisAntigo.text!, nomeNovo: paisNovo.text!, appDel: delegate!)
    }
    
    
    @IBAction func todosPaises(_ sender: Any){
        var result:String! = ""
        if let arr = Pais.getAll(appDel: delegate!){
            for p:Pais in arr {
                result = result + " ! " + p.nome!
            }
        }
        final.text = result
    }
    @IBAction func todasCidades(_ sender: Any) {
        var result:String! = ""
        if let arr = Cidade.getAll(appDel: delegate!){
            for c:Cidade in arr {
                result = result + " ! " + c.nome!
                if let p:Pais = c.temPais {
                    result = result + "(" + p.nome! + ")"
                }
            }
        }
        final.text = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = UIApplication.shared.delegate as? AppDelegate
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

