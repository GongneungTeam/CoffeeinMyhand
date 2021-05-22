//
//  ViewController_login2.swift
//  CoffeeInMyHand
//
//  Created by Hyeong Seok Jung on 2021/05/21.
//

import UIKit

class ViewController_login2: UIViewController {
    
    var userModel = UserModel()
    var imgCoffee: UIImage?
   

    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var coffee: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var welcome2: UILabel!
    @IBOutlet weak var welcome3: UILabel!
    @IBOutlet weak var idtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var loginbnt: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgCoffee = UIImage(named:"Coffee.jpg")
        coffee.image = imgCoffee
        
        super.viewDidLoad()

            // 키보드 내리기
            idtxt.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
            passwordtxt.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
            loginbnt.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        guard let email = idtxt.text, !email.isEmpty else { return }
        guard let password = passwordtxt.text, !password.isEmpty else { return }
        let alert = UIAlertController(title: "형식오류", message: "형식이 틀렸습니다", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        
        
        if userModel.isValidEmail(id: email){
                if let removable = self.view.viewWithTag(100) {
                    removable.removeFromSuperview()
                }
            }
            else {
                shakeTextField(textField: idtxt)
                present(alert, animated: true, completion: nil)
            } // 이메일 형식 오류
        
        if userModel.isValidPassword(pwd: password){
               if let removable = self.view.viewWithTag(101) {
                   removable.removeFromSuperview()
               }
           }
           else{
               shakeTextField(textField: passwordtxt)
               present(alert, animated: true, completion: nil)
           } // 비밀번호 형식 오류
               
    }
    
    
    //Usermodel
    final class UserModel {
        struct User {
            var email: String
            var password: String
        }
        
        var users: [User] = [
            User(email: "abc1234@naver.com", password: "qwerty1234"),
            User(email: "dazzlynnnn@gmail.com", password: "asdfasdf5678")
        ]
        
        // 아이디 형식 검사
        func isValidEmail(id: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: id)
        }
        
        // 비밀번호 형식 검사
        func isValidPassword(pwd: String) -> Bool {
            let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordTest.evaluate(with: pwd)
        }
    } // end of UserModel
    
    //loginmethod
    func loginCheck(id: String, pwd: String) -> Bool {
        for user in userModel.users {
            if user.email == id && user.password == pwd {
                return true // 로그인 성공
            }
        }
        return false
    }
    //enn of loginmethod
    
    // TextField 흔들기 애니메이션
    func shakeTextField(textField: UITextField) -> Void{
        UIView.animate(withDuration: 0.2, animations: {
            textField.frame.origin.x -= 10
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x += 20
             }, completion: { _ in
                 UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x -= 10
                })
            })
        })
    }
    
    @objc func didEndOnExit(_ sender: UITextField) {
        if idtxt.isFirstResponder {
            passwordtxt.becomeFirstResponder()
        }
    }
    
    
    
}
    






   
