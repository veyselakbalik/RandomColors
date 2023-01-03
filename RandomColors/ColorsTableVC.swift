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
            colors.append(createRandomColor())
        }
    }
    
    func createRandomColor() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        
        return randomColor
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
        performSegue(withIdentifier: "toColorsDetailsVC", sender: nil)
    }
    
    
}
