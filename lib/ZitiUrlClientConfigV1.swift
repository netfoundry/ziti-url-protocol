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

public class ZitiUrlClientConfigV1 : Codable, ZitiConfig {
    static var configType = "ziti-url-client.v1"
    
    public let scheme:String
    public let hostname:String
    public var port:Int?
    public var headers: [String: String]?
    
    public func getPort() -> Int { return port ?? (scheme == "https" ? 443 : 80) }
}
