//
//  StudyEntry_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 23/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//ViewController for Study Time
class StudyEntry_VC: UIViewController {
    
    //Outlet
    @IBOutlet weak var navigationbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var backToMainMenuItem: UIBarButtonItem!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Function
        formatVC()
    }
    
    
    //Format View Controller
    func formatVC() {
        
        //Set background
        //Set Variable
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set Image Name
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Image Settings
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Set Navagation Title
        navigationbarOutletNavbar.topItem?.title = "Subject Study Time"
        
        //Set Item Title
        backToMainMenuItem.title = "Back"
        
        //Format Navigation
        navigationbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationbarOutletNavbar.layer.shadowOpacity = 1
        navigationbarOutletNavbar.layer.shadowRadius = 5
        navigationbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
                
    }
    
    //Call Menu
    @IBAction func callMainMenu(_ sender: UIBarButtonItem) {
        
        //Set Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Main Menu
        let mainMenu = mainStoryBoard.instantiateViewController(identifier: "studyMainPahe_VC") as! StudyMainPage_VC
        
        //Call Main menu
        self.present(mainMenu,animated: true,completion: nil)
    }
    



}
