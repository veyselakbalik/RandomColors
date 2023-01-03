//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by Veysel Akbalık on 31.12.2022.
//

import UIKit

class ColorsTableVC: UIViewController   {
    
    var colors : [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()

        
    }
    
    func addRandomColors(){
        for _ in 0..<50 {
            colors.append(.random())
        }
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        destVC.color = sender as? UIColor
    }
}

extension ColorsTableVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "toColorsDetailsVC", sender: color)
    }
    
    
}
