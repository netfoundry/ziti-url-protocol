/*
Copyright NetFoundry, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import Foundation
import CZitiPrivate

@objc public class ZitiMfaEnrollment : NSObject, Codable {
    private static let log = ZitiLog(ZitiMfaEnrollment.self)
    
    public var isVerified:Bool?
    public var provisioningUrl:String?
    public var recoveryCodes:[String]?
    
    init(_ cMfaEnrollment:UnsafeMutablePointer<ziti_mfa_enrollment>) {
        isVerified = cMfaEnrollment.pointee.is_verified
        
        if let cStr = cMfaEnrollment.pointee.provisioning_url {
            provisioningUrl = String(cString: cStr)
        }
        
        if var ptr = cMfaEnrollment.pointee.recovery_codes {
            recoveryCodes = []
            while let s = ptr.pointee {
                recoveryCodes?.append(String(cString:s))
                ptr += 1
            }
        }
    }
}
