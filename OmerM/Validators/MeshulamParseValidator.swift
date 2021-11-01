//
//  ParseValidator.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

class MeshulamParseValidator: NSObject {
    
    public class func parseUrlToJson(strUrl: String, andSubString: String) -> Dict {
        var stringParseToJson = ""
        let start = strUrl.range(of: andSubString)
        
        stringParseToJson = String(strUrl[(start?.upperBound ?? strUrl.startIndex)..<strUrl.endIndex])
        
        let arrData = stringParseToJson.components(separatedBy: "&")
        var strJsonData = "";
        if arrData.count > 0 {
            for data in arrData {
                if data.contains("data") {
                    strJsonData = data
                }
            }
        }
        let data = Data(strJsonData.utf8)
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? Dict {
                // try to read out a string array
                return json
            }
        } catch let error as NSError {
            LogMsg("Failed to load: \(error.localizedDescription)")
            return Dict()
        }
        return Dict()
    }
    
    
    public class func createObjectOfInnerResponsesFromJSONDict(JSONDict: Any, innerResponse: BaseInnerResponse) -> BaseInnerResponse {
           
           if !(JSONDict is [String:Any]) {
               return BaseInnerResponse()
           }
                   
           let aJSONDict = JSONDict as! [String:Any]
           
           let anInnerResponse = innerResponse.buildFromJSONDict(JSONDict: aJSONDict)
           return anInnerResponse
    }
    
    // Primitives
    public class func getIntForKey(key: String, JSONDict: Any, defaultValue: Int)-> (Int) {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        
        if(value is String){
            
            if let anIntValue = Int(value as! String)
            {
                return anIntValue
            }
            else
            {
                return defaultValue
            }
        }
        
        if(value is Int) {
            return (value as! Int)
        }
        
        return defaultValue
        
    }
    
    public class func getFloatForKey(key: String, JSONDict: Any, defaultValue: Float)-> (Float) {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if(value is String) {
            return Float(value as! String)!
        }
        
        if(value is Float) {
            return (value as! Float)
        }
        
        return defaultValue
    }
    
    
    public class func getDoubleForKey(key: String, JSONDict: Any, defaultValue: Double)-> (Double) {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if(value is String) {
            
            if let aValueDouble = Double(value as! String) {
                 return aValueDouble
                
            } else {
                return defaultValue
                
            }
           
        }
        
        if(value is Double) {
            return value as! Double
        }
        
        return defaultValue
    }
    
    
    public class func getBoolForKey(key:String, JSONDict: Any, defaultValue:Bool)-> (Bool) {
        
        if  (!(JSONDict is [String:Any])) {
            return defaultValue;
        }
        
        if (JSONDict as! [String:Any]).isEmpty {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if let aValue = value {
            
            if(aValue is String) {
                
                if ((aValue as! String) == "true" || (aValue as! String) == "TRUE" || (aValue as! String) == "True" || (aValue as! String) == "1" ) {
                    return true
                } else if ((aValue as! String) == "false" || (aValue as! String) == "FALSE" || (aValue as! String) == "False" || (aValue as! String) == "0" ) {
                    return false
                } else {
                    
                    if let theBool = Bool((aValue as! String)) {
                         return theBool;
                    } else {
                        return defaultValue
                    }
                }
            } else  {
                if let val = aValue as? Bool {
                    return val
                } else {
                    return defaultValue
                }
            }
            
        }
        
        return defaultValue
        
    }
    
    
    public class func getStringForKey(key: String, JSONDict: Any, defaultValue: String)-> (String) {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if value is String {
            return value as! String
            
        } else if value is NSNumber {
            return (value as! NSNumber).stringValue
            
        } else if value is URL {
            return (value as! URL).absoluteString
        }
        
        return defaultValue
        
    }
    
    
    public class func getURLForKey(key: String, JSONDict: Any, defaultValue: URL?)-> (URL?) {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if(value is URL) {
            return value as! (URL?)
        }
        
        if(value is String) {
            return URL(string: (value as! String))!
        }
        
        return defaultValue
    }
    
    
    public class func getArrayForKey(key:String, JSONDict: Any, defaultValue: [Any]) -> [Any] {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if(value is [Any]) {
            return value as! [Any]
        }
        else if (value is [String:Any]) {
            return Array((value as! [String:Any]).values)
        }
        
        return defaultValue
    }
    
    
    public class func getDictionaryForKey(key: String, JSONDict: Any, defaultValue: [String:Any])-> ([String:Any]) {
        
        if !(JSONDict is [String:Any]) {
            return defaultValue
        }
        
        let value = (JSONDict as! [String:Any])[key]
        
        if value is [String:Any] {
            return value as! [String:Any]
        }
        
        return defaultValue
        
    }
    
    // Array of innerResponse objects
    
    public class func createArrayOfInnerResponsesFromJSONArray(JSONArray: Any, innerResponse: BaseInnerResponse, shouldReverseOrder: Bool) -> [BaseInnerResponse] {
        
        var tempJsonArray = JSONArray
        
        if (tempJsonArray is [String:Any]) {
            tempJsonArray = Array((JSONArray as! [String:Any]).values)
        }
        
        if !(tempJsonArray is [Any]) {
            return [BaseInnerResponse]()
        }
        
        var mutArrResponses = [BaseInnerResponse]()
        
        let aTempJsonArray = tempJsonArray as! [Any]
        
        for aDict in aTempJsonArray {
            
            if let dict = aDict as? [String:Any] {
                
                let innerResponseInstance = type(of: innerResponse).init()
                let innerResp = innerResponseInstance.buildFromJSONDict(JSONDict: dict)
                mutArrResponses.append(innerResp)
            }
        }
        
        return mutArrResponses
    }
    
    
    public class func createDictionaryOfInnerResponsesFromJSONDict(JSONDict: Any, innerResponse: BaseInnerResponse) -> [String:BaseInnerResponse] {
        
        if !(JSONDict is [String:Any]) {
            return [String:BaseInnerResponse]()
        }
        
        var mutDictResponses = [String:Any]()
        
        let aJSONDict = JSONDict as! [String:Any]
        
        for strKey in aJSONDict.keys {
            
            var dict = [String:Any]()
            
            dict.updateValue(aJSONDict[strKey] as Any, forKey: strKey)
            
            let innerResponseInstance = type(of: innerResponse).init()
            
            let tempDict = MeshulamParseValidator.getDictionaryForKey(key: strKey, JSONDict: aJSONDict, defaultValue: [String:Any]())
            
            let anInnerResponse = innerResponseInstance.buildFromJSONDict(JSONDict: tempDict)

            if strKey == "00" {
                mutDictResponses.updateValue(anInnerResponse, forKey: "0")
            } else {
                mutDictResponses.updateValue(anInnerResponse, forKey: strKey)
            }
            
        }

        return mutDictResponses as! [String : BaseInnerResponse]
    }
}
