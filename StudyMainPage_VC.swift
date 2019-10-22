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
    
    //Set Outlet for constraints
    @IBOutlet weak var menubarLeadingConstraint: NSLayoutConstraint!
    
    //Set Outlet for MenuBar
    @IBOutlet weak var menubarOutletView: UIView!
    @IBOutlet weak var menuTitleOutletLabel: UILabel!
    @IBOutlet weak var studyTimeOutletButton: UIButton!
    @IBOutlet weak var studyTimeOutletLabel: UILabel!
    @IBOutlet weak var amendStudyOutletButton: UIButton!
    @IBOutlet weak var amendStudyOutletLabel: UILabel!
    @IBOutlet weak var studyReportsOutletButton: UIButton!
    @IBOutlet weak var studyReportOutletLabel: UILabel!
    @IBOutlet weak var studyTargetsOutletButton: UIButton!
    @IBOutlet weak var studyTargetOutletLabel: UILabel!
    
    
    //Initialize Menu SlideBar
    var menuSlidebarShowing = false
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Functions
        formatVC() //Set Background
    }
    
    
    //Buttons Action
    
    @IBAction func callMenuActionItem(_ sender: UIBarButtonItem) { //Call Menu
        
        if(menuSlidebarShowing) {
            menubarLeadingConstraint.constant = -117
            
        } else {
            menubarLeadingConstraint.constant = 0
            UIAnimate() //Animate Menu Slidebar
            
        }
        
            menuSlidebarShowing = !menuSlidebarShowing
            UIAnimate()
        
        
    }
    
    //Funcition to animate slidebar
    func UIAnimate() {
        UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
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
        navigationbarOutletNavbar.topItem?.title = "MY STUDY SCHEDULE"
        
        //Format Menubar Color and Opacity
        menubarOutletView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        menubarOutletView.layer.cornerRadius = 10
        
        
        
        
        
        //Set image for Navigation Item
        menuOutletItem.image = UIImage(named: "Menu.png")
        
        //Format the constraints for Menubar
        menubarLeadingConstraint.constant = -117
        
        //Format Menu Labels and Buttons
        menuTitleOutletLabel.textColor = UIColor.white
        studyTimeOutletLabel.textColor = UIColor.white
        amendStudyOutletLabel.textColor = UIColor.white
        studyReportOutletLabel.textColor = UIColor.white
        studyTargetOutletLabel.textColor = UIColor.white
        
        
        //Set images for Main Page Buttons
        let studyTimeImage = UIImage(named: "StudentIcon.png")
        studyTimeOutletButton.setBackgroundImage(studyTimeImage, for: .normal)
        
        let amendStudyImage = UIImage(named: "Maintenance.png")
        amendStudyOutletButton.setBackgroundImage(amendStudyImage, for: .normal)
        
        let studyReportImage = UIImage(named: "StudentRpt.png")
        studyReportsOutletButton.setBackgroundImage(studyReportImage, for: .normal)
        
        let studyTargetsImage = UIImage(named: "subjectTargets.png")
        studyTargetsOutletButton.setBackgroundImage(studyTargetsImage, for: .normal)
       
        
           }
    
    //Call Subject Entry
    @IBAction func studyActionButton(_ sender: UIButton) {
        
        //Set Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Call Study Time
        let studyTimeEntry = mainStoryboard.instantiateViewController(withIdentifier: "studyEntry_VC") as! StudyEntry_VC
        studyTimeEntry.modalPresentationStyle = .fullScreen
        
        //Call Study Entry
        self.present(studyTimeEntry,animated: true,completion: nil)
    }
    
    //Call the Target
    
    @IBAction func studyTargetButton(_ sender: UIButton) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let studyTarget = mainStoryBoard.instantiateViewController(identifier: "studyTargets_V2_VC") as! StudyTargets_V2_VC
        studyTarget.modalPresentationStyle = .fullScreen
        
        //Call the function
        self.present(studyTarget,animated: true,completion: nil)
    }
    
    //Call the Reports Menu
    @IBAction func reportMenuButton(_ sender: UIButton) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Reports Menu
        let reportsMenu = mainStoryBoard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
        reportsMenu.modalPresentationStyle = .fullScreen
        
        //Call Reports Menu
        self.present(reportsMenu,animated: true,completion: nil)
        
    }
    
    //Call Maintenance Page
    @IBAction func maintanceDatbaseButton(_ sender: UIButton) {
        
        //Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Maintance
        let maintRecord = mainStoryboard.instantiateViewController(identifier: "Maintenance_VC") as! Maintenance_VC
        
        //Call Menu
        self.present(maintRecord,animated: true,completion: nil)
        
        
    }
    
    


}
