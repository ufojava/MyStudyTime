//
//  StudyTargets_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 02/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//View Controller to Enter Study Time Targets
class StudyTargets_VC: UIViewController {
    
    //Set Outlets
    @IBOutlet weak var navigationbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navbarItemOutletItem: UIBarButtonItem!
    
    //Text Fields
    @IBOutlet weak var subEnglishOutletText: UITextField!
    @IBOutlet weak var subLiteratureOutletText: UITextField!
    @IBOutlet weak var subHistoryOutletText: UITextField!
    @IBOutlet weak var subBiologyOutletText: UITextField!
    @IBOutlet weak var subChemistryOutletText: UITextField!
    @IBOutlet weak var subMathsOutletText: UITextField!
    @IBOutlet weak var subPhysicsOutletText: UITextField!
    @IBOutlet weak var subGeographyOutletText: UITextField!
    @IBOutlet weak var saveTargetOutletButton: UIButton!
    @IBOutlet weak var infoTargetsOutletLabel: UILabel!
    @IBOutlet weak var tagetInstructionsOutletLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Custom Fucntions
        formatVC() //Format the View Controller
        textFieldDelegate() //Format Text field characters
        
        
       
        
        
        
    }
    
    //Set text field characterset
    func textFieldDelegate() {
        //Configured Text field
        subEnglishOutletText.delegate = self
        subLiteratureOutletText.delegate = self
        subHistoryOutletText.delegate = self
        subBiologyOutletText.delegate = self
        subChemistryOutletText.delegate = self
        subMathsOutletText.delegate = self
        subPhysicsOutletText.delegate = self
        subGeographyOutletText.delegate = self
        
    }
    
    //Button Action
    
    //Save Targets
    @IBAction func saveTargetsButton(_ sender: UIButton) {
        recordUpdateNew()
    }
    
    

    //Format ViewController
    func formatVC() {
        
        //set Background - Other_VCBackground.jpg
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Background Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Image Settings
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Set Navigation Bar Title
        navigationbarOutletNavbar.topItem?.title = "STUDY SUBJECTS TARGETS"
        
        //Change name of the item button in Naviation bar
        navbarItemOutletItem.title = "Back"
        
        //Instructions
        tagetInstructionsOutletLabel.textAlignment = .center
        tagetInstructionsOutletLabel.font = infoTargetsOutletLabel.font.withSize(14)
        tagetInstructionsOutletLabel.textColor = UIColor.red
        tagetInstructionsOutletLabel.text = "Enter your daily study targets hrs (1 - 8)"
        
        
        //Navigation Shadow
        navigationbarOutletNavbar.layer.shadowOpacity = 1
        navigationbarOutletNavbar.layer.shadowRadius = 5
        navigationbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //English
        subEnglishOutletText.layer.shadowOpacity = 1
        subEnglishOutletText.layer.shadowRadius = 5
        subEnglishOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subEnglishOutletText.clearButtonMode = .always
        
        //Literature
        subLiteratureOutletText.layer.shadowOpacity = 1
        subLiteratureOutletText.layer.shadowRadius = 5
        subLiteratureOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subLiteratureOutletText.clearButtonMode = .always
        
        //History
        subHistoryOutletText.layer.shadowOpacity = 1
        subHistoryOutletText.layer.shadowRadius = 5
        subHistoryOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subHistoryOutletText.clearButtonMode = .always
        
        //Biology
        subBiologyOutletText.layer.shadowOpacity = 1
        subBiologyOutletText.layer.shadowRadius = 5
        subBiologyOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subBiologyOutletText.clearButtonMode = .always
        
        //Chemistry
        subChemistryOutletText.layer.shadowOpacity = 1
        subChemistryOutletText.layer.shadowRadius = 5
        subChemistryOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subChemistryOutletText.clearButtonMode = .always
       
        //Maths
        subMathsOutletText.layer.shadowOpacity = 1
        subMathsOutletText.layer.shadowRadius = 5
        subMathsOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subMathsOutletText.clearButtonMode = .always
        
        //Physics
        subPhysicsOutletText.layer.shadowOpacity = 1
        subPhysicsOutletText.layer.shadowRadius = 5
        subPhysicsOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subPhysicsOutletText.clearButtonMode = .always
        
        //Geography
        subGeographyOutletText.layer.shadowOpacity = 1
        subGeographyOutletText.layer.shadowRadius = 5
        subGeographyOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        subGeographyOutletText.clearButtonMode = .always
        
        //Format the Save Button
        saveTargetOutletButton.setTitleColor(.white, for: .normal)
        saveTargetOutletButton.backgroundColor = UIColor.blue
        saveTargetOutletButton.layer.shadowOpacity = 1
        saveTargetOutletButton.layer.shadowRadius = 5
        saveTargetOutletButton.layer.cornerRadius = 8
        saveTargetOutletButton.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    
    
     //Function call menu
    @IBAction func backToMenuButtonItem(_ sender: UIBarButtonItem) {
        
        //Set main mneu - Identifier studyMainPahe_VC
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainMenu = mainStoryboard.instantiateViewController(withIdentifier: "studyMainPahe_VC") as! StudyMainPage_VC
        mainMenu.modalPresentationStyle = .fullScreen
        
        //Call Main Menu
        self.present(mainMenu,animated: true,completion: nil)
        
    }
    
    //Insert / Update record in CoreData
    func recordUpdateNew() {
        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Fetch Record
        let fetcRec = NSFetchRequest<NSFetchRequestResult>(entityName: "Targets")
        
        //Set for new record
        let targetEntity = NSEntityDescription.entity(forEntityName: "Targets", in: context)
        
        let newTarget = NSManagedObject(entity: targetEntity!, insertInto: context)
        
        //Set fault result
        fetcRec.returnsObjectsAsFaults = false
        
        //Insert record / Update exisiting record
        
        do {
            let results = try context.fetch(fetcRec)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        //Retreive English
                        guard result.value(forKey: "subEnglish") != nil else {
                            print("English field has nil value")
                                return
                        }
                        //Set Subject English
                        result.setValue(Int32(subEnglishOutletText.text!), forKey: "subEnglish")
                        
                        //Retreive Literature
                        guard result.value(forKey: "subLiterature") != nil else {
                            print("Literature field has nil value")
                            return
                        }
                        //Set Subject Literature
                        result.setValue(Int32(subLiteratureOutletText.text!), forKey: "subLiterature")
                        
                        //Retreive History
                        guard result.value(forKey: "subHistory") != nil else {
                            print("History has nil value")
                            return
                        }
                        //Set subject History
                        result.setValue(Int32(subHistoryOutletText.text!), forKey: "subHistory")
                        
                        //Retrieve Biology
                        guard result.value(forKey: "subBiology") != nil else {
                            print("Unable to reteive Biology")
                            return
                        }
                        //Set subject Biology
                        result.setValue(Int32(subBiologyOutletText.text!), forKey: "subBiology")
                        
                        //Retrieve Chemistry
                        guard result.value(forKey: "subChemistry") != nil else {
                            print("Unable to retrieve Chemistry")
                            return
                        }
                        
                        //Set subject Chemistry
                        result.setValue(Int32(subChemistryOutletText.text!), forKey: "subChemistry")
                        
                        //Retrieve Maths
                        guard result.value(forKey: "subMaths") != nil else {
                            print("Unable to retrieve Maths")
                            return
                        }
                        
                        //Assign subject Maths
                        result.setValue(Int32(subMathsOutletText.text!), forKey: "subMaths")
                        
                        //Retreive Physics
                        guard result.value(forKey: "subPhysics") != nil else {
                            print("Unable to retreive Physics")
                            return
                        }
                        //Set subject Physics
                        result.setValue(Int32(subPhysicsOutletText.text!), forKey: "subPhysics")
                        
                        //Retrieve Geography
                        guard result.value(forKey: "subGeography") != nil else {
                            print("Unable to retrieve Geography")
                            return
                        }
                        //Set subject Geography
                        result.setValue(Int32(subGeographyOutletText.text!), forKey: "subGeography")
                        
                        
                        //Send save message
                        infoTargetsOutletLabel.textColor = UIColor.blue
                        infoTargetsOutletLabel.textAlignment = .center
                        infoTargetsOutletLabel.text = "Subject Tagets Set"
                                         
                        //Delay the infor screen
                                         
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.infoTargetsOutletLabel.text = ""
                            
                        //Reset Screen
                        self.subEnglishOutletText.text = ""
                        self.subLiteratureOutletText.text = ""
                        self.subHistoryOutletText.text = ""
                        self.subBiologyOutletText.text = ""
                        self.subChemistryOutletText.text = ""
                        self.subMathsOutletText.text = ""
                        self.subPhysicsOutletText.text = ""
                        self.subGeographyOutletText.text = ""
                        }
                        
                    }
                } else { //Enter new record from here if no record exist
                    newTarget.setValue(subEnglishOutletText.text, forKey: "subEnglish")
                    newTarget.setValue(subLiteratureOutletText.text, forKey: "subLiterature")
                    newTarget.setValue(subHistoryOutletText.text, forKey: "subHistory")
                    newTarget.setValue(subBiologyOutletText.text, forKey: "subBiology")
                    newTarget.setValue(subChemistryOutletText.text, forKey: "subChemistry")
                    newTarget.setValue(subMathsOutletText.text, forKey: "subMaths")
                    newTarget.setValue(subPhysicsOutletText.text, forKey: "subPhysics")
                    newTarget.setValue(subGeographyOutletText.text, forKey: "subGeography")
                    
                    //Send save message
                    infoTargetsOutletLabel.textColor = UIColor.yellow
                    infoTargetsOutletLabel.textAlignment = .center
                    infoTargetsOutletLabel.text = "Subject Tagets Set"
                    
                    //Delay the information screen
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self.infoTargetsOutletLabel.text = ""
                        
                        //Reset Screen
                        self.subEnglishOutletText.text = ""
                        self.subLiteratureOutletText.text = ""
                        self.subHistoryOutletText.text = ""
                        self.subBiologyOutletText.text = ""
                        self.subChemistryOutletText.text = ""
                        self.subMathsOutletText.text = ""
                        self.subPhysicsOutletText.text = ""
                        self.subGeographyOutletText.text = ""
                    }
                    
            }
            
        } catch {
            print("Unable to fetch record")
        }
        
        //Save record in CoreDate
        do {
            try context.save()
        } catch {
            
            print("Unable to save record")
        }
        
    }
    


}

//Extension to configure text field to accept digits only
extension StudyTargets_VC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
            
            return true
        } else {
            
            return false
        }
        
        
    }
    
    
    
}
