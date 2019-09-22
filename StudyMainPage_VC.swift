//
//  StudyMainPage_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 22/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

//Main page for the Study Application
class StudyMainPage_VC: UIViewController {
    
    //Set Outlets for the Mainpage
    @IBOutlet weak var navigationbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var menuOutletItem: UIBarButtonItem!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Functions
        formatVC() //Set Background
    }
    
    //Format Main page
    func formatVC() {
    
        //Set background
        let backagoundImage = UIImageView(frame: UIScreen.main.bounds)
        backagoundImage.image = UIImage(named: "StudyMainPage.jpg")
        backagoundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backagoundImage, at: 0)
        
        //Format navigation bar
        navigationbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationbarOutletNavbar.layer.shadowOpacity = 1
        navigationbarOutletNavbar.layer.shadowRadius = 5
        navigationbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Set image for Navigation Item
        menuOutletItem.image = UIImage(named: "Menu.png")
        
        
        
    
        
        
    }
    



}
