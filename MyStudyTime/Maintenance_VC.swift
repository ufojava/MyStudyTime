//
//  Maintenance_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 22/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

class Maintenance_VC: UIViewController {
    
    //Outlet Maintenave ViewController
    @IBOutlet weak var navbaOutletNavbar: UINavigationBar!
    @IBOutlet weak var itemOutletNavbarItem: UIBarButtonItem!
    
    
    @IBOutlet weak var deleteStudyOutletButton: UIButton!
    @IBOutlet weak var deleteStudyOutletLabel: UILabel!
    @IBOutlet weak var resetDatabaseOutletButton: UIButton!
    @IBOutlet weak var resetDatabaseOutletLabel: UILabel!
    @IBOutlet weak var infoResetDBOutletLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom Functions here
        formatVC() //Format ViewController
    }
    
    //Format Maintance ViewController
    func formatVC() {
        
        //Set image backgorund
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Fill
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format Navigation Bar
        navbaOutletNavbar.topItem?.title = "MAINTENANCE MENU"
        navbaOutletNavbar.layer.shadowOpacity = 1
        navbaOutletNavbar.layer.shadowRadius = 5
        navbaOutletNavbar.layer.shadowColor = UIColor.black.cgColor
        navbaOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        itemOutletNavbarItem.title = "Home"
        
        //Button Image
        let delRecImage = UIImage(named: "AmendStudy.png")
            deleteStudyOutletButton.setBackgroundImage(delRecImage, for: .normal)
        
        //Lable for delete Record
        deleteStudyOutletLabel.font = deleteStudyOutletLabel.font.withSize(14)
        deleteStudyOutletLabel.textAlignment = .center
        deleteStudyOutletLabel.text = "Delete Record"
        
        let resetDBImage = UIImage(named: "update_DeleteRecords.png")
            resetDatabaseOutletButton.setBackgroundImage(resetDBImage, for: .normal)
        
        //Reset Database
        resetDatabaseOutletLabel.font = resetDatabaseOutletLabel.font.withSize(14)
        resetDatabaseOutletLabel.textAlignment = .center
        resetDatabaseOutletLabel.text = "Reset Database"
        
        //Format Information lable
        infoResetDBOutletLabel.textColor = UIColor.brown
        infoResetDBOutletLabel.textAlignment = .center
        
        
    }
    
    //Reset Database
    @IBAction func resetDatabaseButton(_ sender: UIButton) {
        resetStdyDB()
        
        //Send reset conformation to label
        infoResetDBOutletLabel.text = "Database has been reset successfully"
        
        //Clear Info Screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.infoResetDBOutletLabel.text = ""
        }
        
    }
    
    
    //Function to Reset Database
    func resetStdyDB() {
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let stdyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
        //Delete Fetched REsult
        let delFetchResult = NSBatchDeleteRequest(fetchRequest: stdyEntity)
        
        //Action the delete process
        do {
            try context.execute(delFetchResult)
            try context.save()
            
        } catch {
            print("Unable to get records")
        }
        
    }
    

    //Main Menu
    @IBAction func callHomeMenu(_ sender: UIBarButtonItem) {
        
        //Set Main StoryBoar
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //CAll Home Menu
        let homeManu = mainStoryboard.instantiateViewController(identifier: "studyMainPahe_VC") as! StudyMainPage_VC
        homeManu.modalPresentationStyle = .fullScreen
        
        //Call Function
        self.present(homeManu,animated: true,completion: nil)
        
    }
    
    //Get Delete Record View Controller
    @IBAction func delRecButton(_ sender: UIButton) {
        
        //Set Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Delete Record VC
        let delStdyRec = mainStoryboard.instantiateViewController(identifier: "DeleteRecord_VC") as! DeleteRecord_VC
            delStdyRec.modalPresentationStyle = .fullScreen
        
        //Call Delete Record View Controller
        self.present(delStdyRec,animated: true,completion: nil)
    }
    
    


}
