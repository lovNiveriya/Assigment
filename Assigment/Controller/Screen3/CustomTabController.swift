//
//  CustomTabController.swift
//  Assigment
//
//  Created by lov niveriya on 17/09/21.
//

import UIKit

class CustomTabController: UITabBarController {

    let view1 = UIView()
    let view2 = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 30
//        .setImage(UIImage(named: "ask_question_poll"), for: .normal)
        view1.contentMode = .scaleAspectFit
        view1.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view1.layer.shadowOpacity = 0.3
        view1.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.view.insertSubview(view1, aboveSubview: self.tabBar)
        //view1.addTarget(self, action: #selector(postButtonClicked), for: .touchUpInside)
        
        view2.layer.cornerRadius = 20
        //button.setImage(UIImage(named: "ask_question_poll"), for: .normal)
        view2.contentMode = .scaleAspectFit
        view2.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view2.layer.shadowOpacity = 0.3
        view2.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.view.insertSubview(view2, aboveSubview: self.tabBar)
        //button.addTarget(self, action: #selector(postButtonClicked), for: .touchUpInside)
        
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubviewToFront(view2)
        view1.backgroundColor = UIColor.white
        view2.backgroundColor = UIColor.blue
        view1.frame = CGRect.init(x: self.tabBar.center.x - 30, y: (self.tabBar.frame.origin.y - 30 ), width: 60, height: 60)
        view2.frame = CGRect.init(x: self.tabBar.center.x - 20, y: (self.tabBar.frame.origin.y - 20), width: 40, height: 40)
    }
   

}
