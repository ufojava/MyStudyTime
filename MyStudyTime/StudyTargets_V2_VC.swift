//
//  StudyTargets_V2_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 14/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData


//Study Targets ViewController Version 2
class StudyTargets_V2_VC: UIViewController {
    
    //Form Outlets - Labels and Steppers
    @IBOutlet weak var navigationbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navbarItemOutletItem: UIBarButtonItem!
    @IBOutlet weak var tagetInstructionsOutletLabel: UILabel!
    
    @IBOutlet weak var subEnglishOutletLabel: UILabel!
    @IBOutlet weak var englishOutletStepper: UIStepper!
    
    @IBOutlet weak var subLiteratureOutletLabel: UILabel!
    @IBOutlet weak var literatureOutletStepper: UIStepper!
    
    @IBOutlet weak var subHistoryOutletLabel: UILabel!
    @IBOutlet weak var historyOutletStepper: UIStepper!
    
    @IBOutlet weak var subBiologyOutletLabel: UILabel!
    @IBOutlet weak var biologyOutletStepper: UIStepper!
    
    @IBOutlet weak var subChemistryOutletLabel: UILabel!
    @IBOutlet weak var chemistryOutletStepper: UIStepper!
    
    @IBOutlet weak var subMathsOutletLabel: UILabel!
    @IBOutlet weak var mathsOutletStepper: UIStepper!
    
    @IBOutlet weak var subPhysicsOutletLabel: UILabel!
    @IBOutlet weak var physicsOutletStepper: UIStepper!
    
    @IBOutlet weak var subGeographyOutletLabel: UILabel!
    @IBOutlet weak var geographyOutletStepper: UIStepper!
    
    //Save Button and Info
    @IBOutlet weak var SaveOutletButton: UIButton!
    @IBOutlet weak var infoFormOutletLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom Functions
        formatVC() //Format Vire Controller
    }
    

    
    //Function to format ViewController
    func formatVC() {
        
        //Set the View Controller background
        
        //Set the Frame
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set the Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Insert image
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Naviagiotn bar format
        navigationbarOutletNavbar.topItem?.title = "STUDY SUBJECTS TARGETS"
        navbarItemOutletItem.title = "Back"
        
        //Navigation Shadow
        navigationbarOutletNavbar.layer.shadowOpacity = 1
        navigationbarOutletNavbar.layer.shadowRadius = 5
        navigationbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        
        //Instructions
        tagetInstructionsOutletLabel.textAlignment = .center
        tagetInstructionsOutletLabel.font = tagetInstructionsOutletLabel.font.withSize(14)
        tagetInstructionsOutletLabel.textColor = UIColor.red
        tagetInstructionsOutletLabel.text = "Enter your daily study targets hrs (1 - 8)"
        
        
        //English
        subEnglishOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subEnglishOutletLabel.layer.borderWidth = 1.0
        subEnglishOutletLabel.textAlignment = .center
        subEnglishOutletLabel.font = subEnglishOutletLabel.font.withSize(14)
        
        englishOutletStepper.layer.borderColor = UIColor.gray.cgColor
        englishOutletStepper.layer.borderWidth = 1.0
        englishOutletStepper.maximumValue = 8.0
        englishOutletStepper.minimumValue = 0.0
        
        //Literature
        subLiteratureOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subLiteratureOutletLabel.layer.borderWidth = 1.0
        subLiteratureOutletLabel.textAlignment = .center
        subLiteratureOutletLabel.font = subLiteratureOutletLabel.font.withSize(14)
        
        literatureOutletStepper.layer.borderColor = UIColor.gray.cgColor
        literatureOutletStepper.layer.borderWidth = 1.0
        literatureOutletStepper.maximumValue = 8.0
        literatureOutletStepper.minimumValue = 0.0
        
        //History
        subHistoryOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subHistoryOutletLabel.layer.borderWidth = 1.0
        subHistoryOutletLabel.textAlignment = .center
        subHistoryOutletLabel.font = subHistoryOutletLabel.font.withSize(14)
                
        historyOutletStepper.layer.borderColor = UIColor.gray.cgColor
        historyOutletStepper.layer.borderWidth = 1.0
        historyOutletStepper.maximumValue = 8.0
        historyOutletStepper.minimumValue = 0.0
        
        //Biology
        subBiologyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subBiologyOutletLabel.layer.borderWidth = 1.0
        subBiologyOutletLabel.textAlignment = .center
        subBiologyOutletLabel.font = subBiologyOutletLabel.font.withSize(14)
                
        biologyOutletStepper.layer.borderColor = UIColor.gray.cgColor
        biologyOutletStepper.layer.borderWidth = 1.0
        biologyOutletStepper.maximumValue = 8.0
        biologyOutletStepper.minimumValue = 0.0
        
        //Chemistry
        subChemistryOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subChemistryOutletLabel.layer.borderWidth = 1.0
        subChemistryOutletLabel.textAlignment = .center
        subChemistryOutletLabel.font = subChemistryOutletLabel.font.withSize(14)
                
        chemistryOutletStepper.layer.borderColor = UIColor.gray.cgColor
        chemistryOutletStepper.layer.borderWidth = 1.0
        chemistryOutletStepper.maximumValue = 8.0
        chemistryOutletStepper.minimumValue = 0.0
        
        //Maths
        subMathsOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subMathsOutletLabel.layer.borderWidth = 1.0
        subMathsOutletLabel.textAlignment = .center
        subMathsOutletLabel.font = subMathsOutletLabel.font.withSize(14)
                
        mathsOutletStepper.layer.borderColor = UIColor.gray.cgColor
        mathsOutletStepper.layer.borderWidth = 1.0
        mathsOutletStepper.maximumValue = 8.0
        mathsOutletStepper.minimumValue = 0.0
        
        //Physics
        subPhysicsOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subPhysicsOutletLabel.layer.borderWidth = 1.0
        subPhysicsOutletLabel.textAlignment = .center
        subPhysicsOutletLabel.font = subPhysicsOutletLabel.font.withSize(14)
                
        physicsOutletStepper.layer.borderColor = UIColor.gray.cgColor
        physicsOutletStepper.layer.borderWidth = 1.0
        physicsOutletStepper.maximumValue = 8.0
        physicsOutletStepper.minimumValue = 0.0
        
        //Geography
        subGeographyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        subGeographyOutletLabel.layer.borderWidth = 1.0
        subGeographyOutletLabel.textAlignment = .center
        subGeographyOutletLabel.font = subGeographyOutletLabel.font.withSize(14)
                
        geographyOutletStepper.layer.borderColor = UIColor.gray.cgColor
        geographyOutletStepper.layer.borderWidth = 1.0
        geographyOutletStepper.maximumValue = 8.0
        geographyOutletStepper.minimumValue = 0.0
        
        
        //Format Save Button
        SaveOutletButton.setTitleColor(.white, for: .normal)
        SaveOutletButton.backgroundColor = UIColor.brown
        SaveOutletButton.layer.borderColor = UIColor.gray.cgColor
        SaveOutletButton.layer.borderWidth = 1
        
        
        //Format the Info text
        infoFormOutletLabel.textAlignment = .center
        
        
    }
    
    //Save Targets
    @IBAction func saveTargetsButton(_ sender: UIButton) {
        new_UpdateTargets() //Function to save record
        

    }
    
    
    
    //Stepper Configuration
    
    //Stepper Variables
    
    var englishStepper = Int32(0)
    var literatureSteper = Int32(0)
    var historyStepper = Int32(0)
    var biologyStepper = Int32(0)
    var chemsitryStepper = Int32(0)
    var mathsStepper = Int32(0)
    var physicsStepper = Int32(0)
    var geographyStepper = Int32(0)
    
    var targetCode = "targetCode"

    
        
    
    //English
    @IBAction func englishActionStepperButton(_ sender: UIStepper) {
        
        var stepperNumber = 0.0
            stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let steppNumberInt32 = Int32(stepperNumber)
        
        englishStepper = steppNumberInt32
        subEnglishOutletLabel.text = "English: \(steppNumberInt32) Hour(s)"
        
    }
    

    
    
    //Literature
    @IBAction func literatureActionStepperButton(_ sender: UIStepper) {
      
        var stepperNumber = 0.0
            stepperNumber = (sender.value)
        
        let stepperNumberInt32 = Int32(stepperNumber)
        literatureSteper = stepperNumberInt32
        subLiteratureOutletLabel.text = "Literature: \(stepperNumberInt32) Hour(s)"
        
        
    }
    
    //History
    @IBAction func historyActionStepperButton(_ sender: UIStepper) {
       
        var stepperNumber = 0.0
            stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let stepperNumberInt32 = Int32(stepperNumber)
        
        historyStepper = stepperNumberInt32
        subHistoryOutletLabel.text = "History: \(stepperNumberInt32) Hour(s)"
        
    }
    
    //Biology
    @IBAction func biologyActionStepperButton(_ sender: UIStepper) {
        
        var stepperNumber = 0.0
            stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let stepperNumberInt32 = Int32(stepperNumber)
        
        biologyStepper = stepperNumberInt32
        subBiologyOutletLabel.text = "Biology: \(stepperNumberInt32) Hour(s)"
        
    }
    
    //Chemistry
    @IBAction func chemistryActionStepperButton(_ sender: UIStepper) {
        
        var stepperNumber = 0.0
            stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let stepperNumberInt32 = Int32(stepperNumber)
        
        chemsitryStepper = stepperNumberInt32
        subChemistryOutletLabel.text = "Chemistry: \(stepperNumberInt32) Hour(s)"
    }
    
    //Maths
    @IBAction func mathsActionStepperButton(_ sender: UIStepper) {
        
        var stepperNumber = 0.0
            stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let stepperNumberInt32 = Int32(stepperNumber)
        
        mathsStepper = stepperNumberInt32
        subMathsOutletLabel.text = "Maths: \(stepperNumberInt32) Hour(s)"
        
    }
    
    //Physics
    @IBAction func physicsActionStepperButton(_ sender: UIStepper) {
       
        var stepperNumber = 0.0
        stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let stepperNumberInt32 = Int32(stepperNumber)
        
        physicsStepper = stepperNumberInt32
        subPhysicsOutletLabel.text = "Physics: \(stepperNumberInt32) Hour(s)"
        
    }
    
    //Geography
    @IBAction func geographyActionStepperButton(_ sender: UIStepper) {
        
        var stepperNumber = 0.0
        stepperNumber = (sender.value)
        
        //Convert to Int32 fopr saving value in CoreData
        let stepperNumberInt32 = Int32(stepperNumber)
        
        geographyStepper = stepperNumberInt32
        subGeographyOutletLabel.text = "Geography: \(stepperNumberInt32) Hour(s)"
    }
    

    
    
    //Call Menu
    
    @IBAction func mainMenuItem(_ sender: UIBarButtonItem) {
        
        //Set main mneu - Identifier studyMainPahe_VC
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainMenu = mainStoryboard.instantiateViewController(withIdentifier: "studyMainPahe_VC") as! StudyMainPage_VC
        mainMenu.modalPresentationStyle = .fullScreen
        
        //Call Main Menu
        self.present(mainMenu,animated: true,completion: nil)
        
    }
    
    
    //Function to save and update study daily targets
    func new_UpdateTargets() {
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        
        //Setup New records
        let newTargets = NSEntityDescription.entity(forEntityName: "Study_Targets", in: context)
        
        let newRecord = NSManagedObject(entity: newTargets!, insertInto: context)
        
        //Get Entity
        let targetsEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study_Targets")
        
        //Predicate
        targetsEntity.predicate = NSPredicate(format: "subTargets == %@", targetCode)
        
        //Set result faults
            targetsEntity.returnsObjectsAsFaults = false
        
        //Check and update existing record in Entity Study_Targets
        
        do {
            let results = try context.fetch(targetsEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                  
                    //Targets - Identifier
                    guard result.value(forKey: "subTargets") != nil else {
                        print("Unable to retrieve subTargets")
                        return
                    }
                    
                    
                    result.setValue(targetCode, forKey: "subTargets")
                    
                    //English
                    guard let resEnglish = result.value(forKey: "subEnglish") else {
                        print("Unable  to get English")
                        return
                    }
                    
                    print("Old English Target: \(resEnglish)")
                     
                    result.setValue(englishStepper, forKey: "subEnglish")
                    
                    //Literature
                    guard let resLiterature = result.value(forKey: "subLiterature") else {
                        print("Unable to retrieve Literature")
                        return
                    }
                    
                    print("Old Literature Target: \(resLiterature)")
                    
                    result.setValue(literatureSteper, forKey: "subLiterature")
                    
                    
                    //History
                    guard let resHistory = result.value(forKey: "subHistory") else {
                        print("Unable to retrieve History")
                        return
                    }
                    
                    print("Old History Target: \(resHistory)")
                    
                    result.setValue(historyStepper, forKey: "subHistory")
                    
                    //Biology
                    guard let resBiology = result.value(forKey: "subBiology") else {
                        print("Unable to retrieve Biology")
                        return
                    }
                    
                    print("Old Biology Target: \(resBiology)")
                    
                    result.setValue(biologyStepper, forKey: "subBiology")
                    
                    
                    //Chemistry
                    guard let resChemistry = result.value(forKey: "subChemistry") else {
                        print("Unable to retrieve Chemistry")
                        return
                    }
                    
                    print("Old Chemistry Target: \(resChemistry)")
                    
                    result.setValue(chemsitryStepper, forKey: "subChemistry")
                    
                    
                    //Maths
                    guard let resMaths = result.value(forKey: "subMaths") else {
                        print("Unable to retrieve Maths")
                        return
                    }
                    
                    print("Old Maths Target: \(resMaths)")
                    
                    result.setValue(mathsStepper, forKey: "subMaths")
                    
                    
                    //Physics
                    guard let resPhysics = result.value(forKey: "subPhysics") else {
                        print("Unable to retrieve Physics")
                        return
                    }
                    
                    print("Old Physics Target: \(resPhysics)")
                    
                    result.setValue(physicsStepper, forKey: "subPhysics")
                    
                    //Geography
                    guard let resGeography = result.value(forKey: "subGeography") else {
                        print("Unable to retrieve Geography")
                        return
                    }
                    
                    print("Old Geography Target: \(resGeography)")
                    
                    result.setValue(geographyStepper, forKey: "subGeography")
                    
                    
                }
                
                
                
                
                
                
            } else {
                
                //Create new record
                print("Unable to get result, Creating new record")
                
                //Enter new Record Entry
                
                //Target Code
                newRecord.setValue(targetCode, forKey: "subTargets") //New Site Code
                newRecord.setValue(englishStepper, forKey: "subEnglish") //New English Target
                newRecord.setValue(literatureSteper, forKey: "subLiterature") //New Literature Target
                newRecord.setValue(historyStepper, forKey: "subHistory") //New History Target
                newRecord.setValue(biologyStepper, forKey: "subBiology") //New Biology Target
                newRecord.setValue(chemsitryStepper, forKey: "subChemistry") //New Chemistry Target
                newRecord.setValue(mathsStepper, forKey: "subMaths") //New Maths Target
                newRecord.setValue(physicsStepper, forKey: "subPhysics") //New Physics Target
                newRecord.setValue(geographyStepper, forKey: "subGeography") //New Geography Target
                
                //Set information screen
                infoFormOutletLabel.textColor = UIColor.blue
                infoFormOutletLabel.text = "Targets Inserted Successfully"
                
            }
        } catch {
            print("Unable to retreive records")
        }
        
    
        
        //Save record
        
        do {
            try context.save()
            
        } catch {
            
            print("Unable to save targets")
            
        }
    }
    
    
    

    

}
