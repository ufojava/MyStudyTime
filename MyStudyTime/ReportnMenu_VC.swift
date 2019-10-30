//
//  ReportnMenu_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 05/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit

class ReportnMenu_VC: UIViewController {
    
    //ViewController Outlet
    @IBOutlet weak var navbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var itemOutletItemButton: UIBarButtonItem!
    
    //Outlet for buttons
    @IBOutlet weak var allStudyReportOutletButton: UIButton!
    @IBOutlet weak var allStudyRptOutletLabel: UILabel!
    @IBOutlet weak var subjectRptOutletButton: UIButton!
    @IBOutlet weak var subjectRptOutletLabel: UILabel!
    @IBOutlet weak var targetRptOutletButton: UIButton!
    @IBOutlet weak var tartgetRptOutletLabel: UILabel!
    @IBOutlet weak var targetDetailOutletButton: UIButton!
    @IBOutlet weak var targetsDetailsOutletLabel: UILabel!
    @IBOutlet weak var graphicalRptOutletButton: UIButton!
    @IBOutlet weak var graphicalRptOutletLabel: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom Function from here
        formatVC() //Format the ViewController
    }
    
    //Format ViewController
    func formatVC() {
        
        //Setbackground image
        let backagroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Background Imabge
        backagroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Apply  image to background
        backagroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backagroundImage, at: 0)
        
        //Format the navigation bar
        navbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navbarOutletNavbar.layer.shadowOpacity = 1
        navbarOutletNavbar.layer.shadowRadius = 5
        navbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format the Button Descriptions
        allStudyRptOutletLabel.font = allStudyRptOutletLabel.font.withSize(14)
        allStudyRptOutletLabel.textAlignment = .center
        allStudyRptOutletLabel.text = "Study Report"
        
        subjectRptOutletLabel.font = subjectRptOutletLabel.font.withSize(14)
        subjectRptOutletLabel.textAlignment = .center
        subjectRptOutletLabel.text = "Subject Report"
        
        tartgetRptOutletLabel.font = tartgetRptOutletLabel.font.withSize(14)
        tartgetRptOutletLabel.textAlignment = .center
        tartgetRptOutletLabel.text = "Target Report"
        
        graphicalRptOutletLabel.font = graphicalRptOutletLabel.font.withSize(14)
        graphicalRptOutletLabel.textAlignment = .center
        graphicalRptOutletLabel.text = "Graph Reports"
        
        
        //Physics.png
        targetsDetailsOutletLabel.font = targetsDetailsOutletLabel.font.withSize(14)
        targetsDetailsOutletLabel.textAlignment = .center
        targetsDetailsOutletLabel.text = "Target Details"
        
        
        
        
        
        
        
        //Set Menu Title
        navbarOutletNavbar.topItem?.title = "STUDY REPORTS MENU"
        
        //Change the name of Item
        itemOutletItemButton.title = "Home"
        
        //Set colour for Menu lables
        allStudyRptOutletLabel.textColor = UIColor.black
        subjectRptOutletLabel.textColor = UIColor.black
        tartgetRptOutletLabel.textColor = UIColor.black
        graphicalRptOutletLabel.textColor = UIColor.black
        
        //Format button image
        
        let allStdyRptImage = UIImage(named: "BookIcon.png")
        allStudyReportOutletButton.setBackgroundImage(allStdyRptImage, for: .normal)
        
        let subStdyImage = UIImage(named: "ReadTime.png")
        subjectRptOutletButton.setBackgroundImage(subStdyImage, for: .normal)
        
        let targetImage = UIImage(named: "StudentIcon")
        targetRptOutletButton.setBackgroundImage(targetImage, for: .normal)
        
        let targetDetailsImage = UIImage(named: "Physics.png")
        targetDetailOutletButton.setBackgroundImage(targetDetailsImage, for: .normal)
        
        let graphImage = UIImage(named: "graphRpt")
        graphicalRptOutletButton.setBackgroundImage(graphImage, for: .normal)
        
                
        
    }
    
    //Call Menus
    @IBAction func callHomeMenu(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Home Menu
        let homeMenu = mainStoryBoard.instantiateViewController(identifier: "studyMainPahe_VC") as! StudyMainPage_VC
        homeMenu.modalPresentationStyle = .fullScreen
        
        //Call the main menu
        self.present(homeMenu,animated: true,completion:nil )
    }
    
    //Study Report - By Date
    @IBAction func studyRprByDate(_ sender: UIButton) {
        
        //Main StoryBoard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Study Report by Date
        let reportByDate = mainStoryBoard.instantiateViewController(identifier: "studyRptByDate_VC") as! studyRptByDate_VC
        reportByDate.modalPresentationStyle = .fullScreen
        
        //Call Report by Date
        self.present(reportByDate,animated: true,completion: nil)
        
    }
    
    
    //Get Target Report
    @IBAction func targetsReport(_ sender: UIButton) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Target Report
        let targetsRport = mainStoryBoard.instantiateViewController(identifier: "targetsReport_VC") as! TargetsReport_VC
        targetsRport.modalPresentationStyle = .fullScreen
        
        //Call Menu
        self.present(targetsRport,animated: true,completion: nil)
        
    }
    
    //Call Subject Report
    @IBAction func callSubjectReport(_ sender: UIButton) {
        
        //Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Call Subject Report
        let subjectReport = mainStoryboard.instantiateViewController(identifier: "subjectReport_VC") as! SubjectReport_VC
            subjectReport.modalPresentationStyle = .fullScreen
        
        self.present(subjectReport,animated: true,completion: nil)
        
        
    }
    
    //Call Targets Details Menu
    @IBAction func targetsDetailReport(_ sender: UIButton) {
        
        //Set Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Targets Details Report
        let targetsDetailRpt = mainStoryBoard.instantiateViewController(identifier: "TargetDetailsRpt_VC") as! TargetDetailsRpt_VC
            targetsDetailRpt.modalPresentationStyle = .fullScreen
        
        //Call Target Details Report
        self.present(targetsDetailRpt,animated: true,completion: nil)
    }
    
    
    

 

}
