//
//  DeleteRecord_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 22/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Delete Study Records
class DeleteRecord_VC: UIViewController {
    
    //Outlets for View Controller
    @IBOutlet weak var navbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navbarItemOutletItem: UIBarButtonItem!
    @IBOutlet weak var pickerviewOutletPickerView: UIPickerView!
    @IBOutlet weak var stdyOutletFromText: UITextField!
    @IBOutlet weak var stdyOutletToText: UITextField!
    @IBOutlet weak var tableviewOutletTableView: UITableView!
    @IBOutlet weak var infoDelRecOutletLabel: UILabel!
    @IBOutlet weak var pickerviewOutletLabel: UILabel!
    @IBOutlet weak var searchOutletButton: UIButton!
    
    
    var subjectArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Functions from here
        formatVC() //Format View Controller
        
    }
    
    
    //Function for format ViewController
    func formatVC() {
        
        //Set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set the image to use
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Image Aspect
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        //Set Navbar Title
        navbarOutletNavbar.topItem?.title = "DELETE STUDY RECORD"
        navbarItemOutletItem.title = "Back"
        navbarOutletNavbar.layer.shadowOpacity = 1
        navbarOutletNavbar.layer.shadowRadius = 5
        navbarOutletNavbar.layer.shadowColor = UIColor.black.cgColor
        navbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format fields
        pickerviewOutletPickerView.layer.borderColor = UIColor.gray.cgColor
        pickerviewOutletPickerView.layer.borderWidth = 1.0
        
        
        stdyOutletFromText.font = stdyOutletFromText.font?.withSize(14)
        stdyOutletFromText.layer.borderColor = UIColor.gray.cgColor
        stdyOutletFromText.layer.borderWidth = 1.0
        stdyOutletFromText.clearButtonMode = .always
        
       
        stdyOutletToText.font = stdyOutletToText.font?.withSize(14)
        stdyOutletToText.layer.borderColor = UIColor.gray.cgColor
        stdyOutletToText.layer.borderWidth = 1.0
        stdyOutletToText.clearButtonMode = .always
        
        //Search button
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = UIColor.brown
        searchOutletButton.layer.borderColor = UIColor.gray.cgColor
        searchOutletButton.layer.borderWidth = 1.0
        
        pickerviewOutletLabel.textColor = UIColor.purple
        pickerviewOutletLabel.font = pickerviewOutletLabel.font?.withSize(17)
        pickerviewOutletLabel.layer.borderColor = UIColor.gray.cgColor
        pickerviewOutletLabel.layer.borderWidth = 1.0
        
        tableviewOutletTableView.layer.borderColor = UIColor.gray.cgColor
        tableviewOutletTableView.layer.borderWidth = 1.0
        
        
        
        
        
    }
    
    //Call Maintenance Menu
    @IBAction func callMaintMenu(_ sender: UIBarButtonItem) {
        
        //Set Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Maint Menu
        let maintMenu = mainStoryboard.instantiateViewController(identifier: "Maintenance_VC") as! Maintenance_VC
            maintMenu.modalPresentationStyle = .fullScreen
        
        //Call Maintenance Menu
        self.present(maintMenu,animated:  true,completion: nil)
        
    }
    

    

}
