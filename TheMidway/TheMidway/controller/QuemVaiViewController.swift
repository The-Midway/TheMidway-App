//
//  QuemVaiViewController.swift
//  TheMidway
//
//  Created by Beatriz Duque on 24/11/21.
//

import UIKit


protocol QuemVaiViewControllerDelegate: AnyObject {
    func didReload()
}

class QuemVaiViewController: UIViewController {
    
    weak var delegate: QuemVaiViewControllerDelegate?
    public var teste = "oie"
    
    override func viewDidLoad() {
        print(teste)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public func setTeste(teste: String){
        self.teste = teste
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}