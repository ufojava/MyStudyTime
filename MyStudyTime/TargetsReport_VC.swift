//
//  TargetsReport_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 14/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Targets Report
class TargetsReport_VC: UIViewController {
    
    //Navigation Bar Outlet
    @IBOutlet weak var navigationOutletNavBar: UINavigationBar!
    @IBOutlet weak var navigationbarOutletItem: UIBarButtonItem!
    @IBOutlet weak var targetsOutletsButton: UIButton!
    
    
    
    //Target Report Outlets
    @IBOutlet weak var englishOutletLabel: UILabel!
    @IBOutlet weak var literatureOutletLabel: UILabel!
    @IBOutlet weak var historyOutletLabel: UILabel!
    @IBOutlet weak var biologyOutletLabel: UILabel!
    @IBOutlet weak var chemistryOutletLabel: UILabel!
    @IBOutlet weak var mathsOutletLabel: UILabel!
    @IBOutlet weak var physicsOutletLabel: UILabel!
    @IBOutlet weak var geographyOutletLabel: UILabel!
    @IBOutlet weak var infoOutletLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom functions from here
        formatRptVC() //Formar Report
    }
    
    
    //Format Report form
    func formatRptVC() {
        
        //Set background and Image
        let backgroundImage = UIImageView(frame:    UIScreen.main.bounds)
        
        //Set Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Backgroung Image property
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Navigation Bar
        navigationOutletNavBar.topItem?.title = "STUDY TARGETS REPORT"
        navigationbarOutletItem.title = "Back"
        
        //Format Labels
        englishOutletLabel.textColor = UIColor.blue
        englishOutletLabel.font = englishOutletLabel.font.withSize(14)
        englishOutletLabel.textAlignment = .center
        englishOutletLabel.layer.borderColor = UIColor.gray.cgColor
        englishOutletLabel.layer.borderWidth = 1.0
        
        literatureOutletLabel.textColor = UIColor.blue
        literatureOutletLabel.font = literatureOutletLabel.font.withSize(14)
        literatureOutletLabel.textAlignment = .center
        literatureOutletLabel.layer.borderColor = UIColor.gray.cgColor
        literatureOutletLabel.layer.borderWidth = 1.0
        
        historyOutletLabel.textColor = UIColor.blue
        historyOutletLabel.font = historyOutletLabel.font.withSize(14)
        historyOutletLabel.textAlignment = .center
        historyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        historyOutletLabel.layer.borderWidth = 1.0
        
        biologyOutletLabel.textColor = UIColor.blue
        biologyOutletLabel.font = biologyOutletLabel.font.withSize(14)
        biologyOutletLabel.textAlignment = .center
        biologyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        biologyOutletLabel.layer.borderWidth = 1.0
        
        chemistryOutletLabel.textColor = UIColor.blue
        chemistryOutletLabel.font = chemistryOutletLabel.font.withSize(14)
        chemistryOutletLabel.textAlignment = .center
        chemistryOutletLabel.layer.borderColor = UIColor.gray.cgColor
        chemistryOutletLabel.layer.borderWidth = 1.0
        
        mathsOutletLabel.textColor = UIColor.blue
        mathsOutletLabel.font = mathsOutletLabel.font.withSize(14)
        mathsOutletLabel.textAlignment = .center
        mathsOutletLabel.layer.borderColor = UIColor.gray.cgColor
        mathsOutletLabel.layer.borderWidth = 1.0
        
        physicsOutletLabel.textColor = UIColor.blue
        physicsOutletLabel.font = physicsOutletLabel.font.withSize(14)
        physicsOutletLabel.textAlignment = .center
        physicsOutletLabel.layer.borderColor = UIColor.gray.cgColor
        physicsOutletLabel.layer.borderWidth = 1.0
        
        geographyOutletLabel.textColor = UIColor.blue
        geographyOutletLabel.font = geographyOutletLabel.font.withSize(14)
        geographyOutletLabel.textAlignment = .center
        geographyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        geographyOutletLabel.layer.borderWidth = 1.0
        
        //Format Button
        targetsOutletsButton.setTitleColor(.white, for: .normal)
        targetsOutletsButton.backgroundColor = UIColor.brown
        targetsOutletsButton.layer.borderColor = UIColor.gray.cgColor
        targetsOutletsButton.layer.borderWidth = 1
        
        
        //Navigation Bar
        navigationOutletNavBar.layer.shadowColor = UIColor.black.cgColor
        navigationOutletNavBar.layer.shadowOpacity = 1
        navigationOutletNavBar.layer.shadowRadius = 5
        navigationOutletNavBar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
    }
    
    //Button Action
    @IBAction func getTargetRecordButton(_ sender: UIButton) {
        getTargets()
        //deleteAllRec()
    }
    
    

    //Call Report Menu
    @IBAction func backReportMenu(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Reports Menu
        let reportsMenu = mainStoryBoard.instantiateViewController(withIdentifier: "reportMenu_VC") as! ReportnMenu_VC
        reportsMenu.modalPresentationStyle = .fullScreen
        
        //Call menu
        self.present(reportsMenu,animated: true,completion: nil)
        
        
    }
    
    

    
    var targetCode = "targetCode"
    var totalStudyTime = Int32(0)
    
    
    //Get Reports from Targets
    func getTargets() {
        
        //Reset Total Study Time
        totalStudyTime = Int32(0)
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Set Entity
        let targetEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study_Targets")
        
        //Set Predicate
        targetEntity.predicate = NSPredicate(format: "subTargets == %@", targetCode)
        
        
        
        //Set fault reports
        targetEntity.returnsObjectsAsFaults = false
        
        //Get Data
        
        do {
            let results = try context.fetch(targetEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                
                    //English
                    guard let resEnglish = result.value(forKey: "subEnglish") else {
                        print("Unable to get English")
                        return
                    }
                    
                    //Assign result value to variable
                    englishOutletLabel.text = "English: \(resEnglish)"
                    totalStudyTime += resEnglish as! Int32
                    
                    //Literature
                    guard let resLiterature = result.value(forKey: "subLiterature") else {
                        print("Unable to get Literature")
                        return
                    }
                    
                    //Assign the result to label
                    literatureOutletLabel.text = "Literature: \(resLiterature)"
                    totalStudyTime += resLiterature as! Int32
                    
                    //History
                    guard let resHistory = result.value(forKey: "subHistory") else {
                        print("Unable to get History")
                        return
                    }
                    
                    //Assign result to label
                    historyOutletLabel.text = "History: \(resHistory)"
                    totalStudyTime += resHistory as! Int32
                    
                    
                    //Biology
                    guard let resBiology = result.value(forKey: "subBiology") else {
                        print("Unable to get Biology")
                        return
                    }
                    
                    //Assign result to label
                    biologyOutletLabel.text = "Biology: \(resBiology)"
                    totalStudyTime += resBiology as! Int32
                    
                    //Chemistry
                    guard let resChemistry = result.value(forKey: "subChemistry") else {
                        print("Unable to get Chemistry")
                        return
                    }
                    
                    //Assign result to label
                    chemistryOutletLabel.text = "Chemistry: \(resChemistry)"
                    totalStudyTime += resChemistry as! Int32
                    
                    
                    //Maths
                    guard let resMaths = result.value(forKey: "subMaths") else {
                        print("Unable to get Maths")
                        return
                    }
                    
                    //Assign result to label
                    mathsOutletLabel.text = "Maths: \(resMaths)"
                    totalStudyTime += resMaths as! Int32
                    
                    
                    //Physics
                    guard let resPhysics = result.value(forKey: "subPhysics") else {
                        print("Unable to get Physics")
                        return
                    }
                    
                    //Assign result to label
                    physicsOutletLabel.text = "Physics: \(resPhysics)"
                    totalStudyTime += resPhysics as! Int32
                    
                    //Geography
                    guard let resGeography = result.value(forKey: "subGeography") else {
                        print("Unable to get Geography")
                        return
                    }
                    
                    //Assign result to label
                    geographyOutletLabel.text = "Geography: \(resGeography)"
                    totalStudyTime += resGeography as! Int32
                    
                    //Total Study time
                    infoOutletLabel.textColor = UIColor .systemYellow
                    infoOutletLabel.textAlignment = .left
                    infoOutletLabel.text = "Total Study Time: \(totalStudyTime) Hour(s)"
                    
                }
                
            } else {
                infoOutletLabel.text = "No record found"
            }
            

        } catch {
            print("Unable to get data")
        }
        
    }
    
    //************ FUNCTION TO DELETE OBJECTS IN STUDY_TARGETS DATABASAE **************
    
    func deleteAllRec() {
        
        //Set Context
              let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
              
              //Setup New records
              let delAllRec = NSFetchRequest<NSFetchRequestResult>(entityName: "Study_Targets")
                    
                    let delFetchRecrods = NSBatchDeleteRequest(fetchRequest: delAllRec)
        
                
        do {
            try context.execute(delFetchRecrods)
            try context.save()
            
        } catch {
            print("Unable to delete records")
        }
            
    }
    
    //************ FUNCTION TO DELETE OBJECTS IN STUDY_TARGETS DATABASAE **************
    

}
