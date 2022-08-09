//
//  ViewController.swift
//  SignUpForm
//
//  Created by Akshit Sharma on 04/06/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var txtfFullName: UITextField!
    @IBOutlet weak var txtfEmail: UITextField!
    @IBOutlet weak var txfPassword: UITextField!
    
    @IBOutlet weak var txtvAddress: UITextView!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfPassword.passwordRules = .none
        txtvAddress.text = "Address"
        txtvAddress.textColor = .placeholderText
        txtvAddress.backgroundColor = .white
        
        txfPassword.delegate = self
        txtvAddress.delegate = self
        
        txtvAddress.layer.borderWidth = 2
        txtvAddress.layer.borderColor = UIColor.gray.cgColor
        
        btnMale.setImage(UIImage(named: "RadioBtn2"), for: .selected)
        btnMale.setImage(UIImage(named: "RadioBtn1"), for: .normal)
        btnFemale.setImage(UIImage(named: "RadioBtn2"), for: .selected)
        btnFemale.setImage(UIImage(named: "RadioBtn1"), for: .normal)
        
        btnMale.addTarget(self, action: #selector(radioBtnAction(_:)), for: .touchUpInside)
        btnFemale.addTarget(self, action: #selector(radioBtnAction(_:)), for: .touchUpInside)
    }
    
    @objc func radioBtnAction(_ sender:UIButton){
        switch sender{
        case btnMale:
            btnMale.isSelected = true
            btnFemale.isSelected = false
        case btnFemale:
            btnFemale.isSelected = true
            btnMale.isSelected = false
        default:break
        }
//        if(sender == btnMale){
//        }else if (sender == btnFemale){
//        }
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        if (txtfFullName.text!.isEmpty){
            print("FullName is required!")
        }
        else if(txtfEmail.text!.isEmpty){
            print("Email is required!")
        }else if (txfPassword.text!.isEmpty){
            print("Pasword is required!")
        }else if (txtvAddress.text == "Address"){
            print("Address is required!")
        } else if(!btnMale.isSelected && !btnFemale.isSelected){
            print("Plase select your gender.")
        }
        else{
            print("Name: ",txtfFullName.text!)
            print("Email: ",txtfEmail.text!)
            print("Password: ",txfPassword.text!)
            print("Address: ",txtvAddress.text!)
            if(btnMale.isSelected){
                print("Gender: Male")
            }else if(btnFemale.isSelected){
                print("Gender: Female")
            }
            print("SignUp complated")
            
            ///Form Clear
            txtfFullName.text = ""
            txtfEmail.text = ""
            txfPassword.text = ""
            txtvAddress.text = ""
            btnMale.isSelected = false
            btnFemale.isSelected = false
        }
    }
    
}


extension ViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField{
        case txtfFullName:
            switch string{
            case "0","1","2","3","4":
                return false
            default:
                return true
            }
        default:break
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case txtfFullName:
            txtfFullName.resignFirstResponder()
            txtfEmail.becomeFirstResponder()
        case txtfEmail:
            txtfEmail.resignFirstResponder()
            txfPassword.becomeFirstResponder()
        case txfPassword:
            txfPassword.resignFirstResponder()
            txtvAddress.becomeFirstResponder()
        default:break
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}

extension ViewController:UITextViewDelegate{
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "Address"){
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text.isEmpty){
            textView.text = "Address"
            textView.textColor = .placeholderText
        }
    }
    
}
