//
//  ViewController.swift
//  proj1
//
//  Created by Student on 01/04/19.
//  Copyright © 2019 ace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var xTurn:Bool=true
    var isGameActive=true
    var board=[" "," "," "," "," "," "," "," "," "]
    
    @IBOutlet weak var statelbl: UILabel!
    
    let winningCombos=[ [0,1,2],[6,7,8],[3,4,5],[8,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    func checkWinner(){
        for combo in winningCombos{
            if(board[combo[0]] != " " && board[combo[0]]==board[combo[1]] && board[combo[0]]==board[combo[2]]){
            isGameActive = false
                if(board[combo[0]] == "X"){
                    statelbl.text = "X Won"
                    statelbl.textColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
                    statelbl.isHidden = false
                }
               else{
                    statelbl.text = "O Won"
                    statelbl.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                    statelbl.isHidden = false
                }
            }else{
        var count=0
            for i in 0...8{
                if(board[i]==" "){
                    count+=1
                }
            }
            if (count==0){
                isGameActive=false
                statelbl.text = "Its a draw"
                statelbl.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
                statelbl.isHidden = false
                break
                }}}}
    @IBAction func buttonTapped(_ sender: UIButton) {
        if(isGameActive){
        if(board[sender.tag] == " "){
        
        if(xTurn)
     {
        sender.setImage(#imageLiteral(resourceName: "NeonX"), for: .normal)
        board[sender.tag] = "X"
        
     }
     else{
        sender.setImage(#imageLiteral(resourceName: "NeonO"), for: .normal)
        board[sender.tag] = "O"
            }
        checkWinner()
        xTurn = !xTurn
        }
        }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
}

}

