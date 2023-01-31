//
//  UserInfoViewController.swift
//  practice1
//
//  Created by APPLE on 2022/10/06.
//  Copyright © 2022 sejin. All rights reserved.
//

import UIKit
import DropDown

struct PostComment: Codable {
    let user_name: String
    let tier: String
    let position: String
}

public var userName = " 아이디를 입력해주세요"

class UserInfoViewController: UIViewController {
    
    
    var userTier  = " 티어를 선택해주세요"
    var userPosition = " 포지션을 선택해주세요"
    let tierDropDown = DropDown()
    let positionDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserInfoView.userNameTextField.delegate = self
        view.addSubview(UserInfoView.userInfoStackView)
        view.addSubview(UserInfoView.enterButton)
        userTierDropDownButton.setTitle(userTier, for: .normal)
        userPositionDropDownButton.setTitle(userPosition, for: .normal)
        setupAutoLayout()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    private func setupAutoLayout() {
        
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        userInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        userInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        userInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        userInfoStackView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        userTierDropDownButton.translatesAutoresizingMaskIntoConstraints = false
        userTierDropDownButton.widthAnchor.constraint(equalToConstant: 200).isActive = true

        userPositionDropDownButton.translatesAutoresizingMaskIntoConstraints = false
        userPositionDropDownButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterButton.topAnchor.constraint(equalTo: userInfoStackView.bottomAnchor, constant: 60).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func enterButtonTapped(){
        sendToServer()
        let nextView = RoomListViewController()
        nextView.modalPresentationStyle = .fullScreen
        self.present(nextView, animated: true, completion: nil)
    }
    
    
    @objc func tierDropDownButtonTapped(){
        setDropDown()
        setTierDropDown()
        tierDropDown.show()
        checkAllInfoCreated()
    }
    
    @objc func positionDropDownButtonTapped(){
        setDropDown()
        setPositionDropDown()
        positionDropDown.show()
        
    }
    
    func setDropDown(){
        DropDown.appearance().textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        DropDown.appearance().backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        DropDown.appearance().selectionBackgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        DropDown.appearance().setupCornerRadius(8)
    }
    
    func setTierDropDown(){
        let tierList = ["bronze 5", "silver 4","gold 3","gold 1","challenger"]
        tierDropDown.dataSource = tierList
        tierDropDown.anchorView = userTierDropDownButton
        tierDropDown.dismissMode = .automatic
        tierDropDown.bottomOffset = CGPoint(x:0, y:(tierDropDown.anchorView?.plainView.bounds.height)!)
        tierDropDown.selectionAction = { [weak self] (index, item)in
            self?.userTier = item
            self?.userTierDropDownButton.setTitle("\(item)", for: .normal)
            self?.checkAllInfoCreated()
        }
    }
    
    func setPositionDropDown(){
        let positionList = ["support", "bottom","middle","jungle","top"]
        positionDropDown.dataSource = positionList
        positionDropDown.anchorView = userPositionDropDownButton
        positionDropDown.dismissMode = .automatic
        positionDropDown.bottomOffset = CGPoint(x:0, y:(positionDropDown.anchorView?.plainView.bounds.height)!)
        positionDropDown.selectionAction = { [weak self] (index, item)in
            self?.userPosition = item
            self?.userPositionDropDownButton.setTitle("\(item)", for: .normal)
            self?.checkAllInfoCreated()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func sendToServer(){
         guard let url = URL(string: "http://192.168.43.119:3000/user") else {return}
         var request : URLRequest = URLRequest(url: url)
         request.httpMethod = "post"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         let comment = PostComment(user_name: userName, tier: userTier, position: userPosition)
         guard let uploadData = try? JSONEncoder().encode(comment) else {return}
         let dataTask = URLSession(configuration: .default).uploadTask(with: request, from: uploadData) {
             (data: Data?, response: URLResponse?, error: Error?) in
             guard error == nil else {
                 print("Error occur: \(String(describing: error))")
                 return
             }
             guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                 return
             }
             guard (try? JSONSerialization.jsonObject(with: data, options: [])) != nil else {
                 print("json to Any Error")
                 return
             }
        }
        dataTask.resume()
    }
    
    func checkAllInfoCreated(){
        if  let name = userNameTextField.text, !name.isEmpty,
            let tier = userTierDropDownButton.titleLabel?.text, !tier.isEmpty,
            let position = userPositionDropDownButton.titleLabel?.text, !position.isEmpty
        {
            if tier != " 티어를 선택해주세요" && position != " 포지션을 선택해주세요"{
                enterButton.backgroundColor = .clear
                enterButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
                enterButton.isEnabled = true
                userName = name
                userTier = tier
                userPosition = position
            }
        }
        else {
            enterButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            enterButton.isEnabled = false
            return
        }
    }

}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UserInfoViewController: UITextFieldDelegate {
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        checkAllInfoCreated()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension UIStackView{
    func insertViewIntoStack(background: UIColor, cornerRadius: CGFloat, borderColor: CGColor, borderWidth: CGFloat) {
        let subView = UIView(frame: bounds)
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subView.layer.cornerRadius = cornerRadius
        subView.backgroundColor = background
        subView.layer.borderColor = borderColor
        subView.layer.borderWidth = borderWidth
        subView.clipsToBounds = true
        insertSubview(subView, at: 0)
    }
}
