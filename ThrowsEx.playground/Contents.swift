import UIKit

enum LoginValidationError:Error {
   case fillFields
   case emailValidationFailed
   case passwordLengthNotCorrect
}

protocol ThrowsExampleProtocol:AnyObject{
    func login() throws
    func validatePasswordLength() -> Bool
}

class ThrowsExample:ThrowsExampleProtocol
{
    //Change these 2 vars to test the throw error
    var email:String? = "abc@gmail.com"
    var password:String? = "111111"
    
    func login() throws{
        guard let email = self.email, let password = self.password else{
            throw LoginValidationError.fillFields
        }
        let isValidMailId = ThrowsExample.isValidEmail(email: email)
        if !isValidMailId{
            throw LoginValidationError.emailValidationFailed
        }
        if password.count < 8{
            throw LoginValidationError.passwordLengthNotCorrect
        }
        //Proceed to Login
        self.proceedToLogin()
        
    }
    func proceedToLogin(){}
    func validatePasswordLength() -> Bool {return true}
}

extension ThrowsExample
{
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

//----
let object = ThrowsExample()
do{
    try object.login()
}catch LoginValidationError.fillFields{
    print("Kindly fill all the fileds")
}catch LoginValidationError.emailValidationFailed{
    print("Email is not valid")
}catch LoginValidationError.passwordLengthNotCorrect{
    print("Password should be >= 8")
}
