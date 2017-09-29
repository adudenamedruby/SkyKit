//
//  Languages.swift
//  SkyKit
//
//  Created by roux on 2017-09-28.
//  Copyright © 2017 ACME|labs. All rights reserved.
//

import Foundation


/// The desired language in which all summary properties will be returned. (Note that units in the summary will be set according to the units parameter, so be sure to set both parameters appropriately.)
public enum Languages: String {
    
    /// Arabic.
    case arabic = "ar"
    
    /// Azerbaijani.
    case azerbaijani = "az"
    
    /// Belarusian.
    case belarusian = "be"
    
    /// Bulgarian.
    case bulgarian = "bg"
    
    /// Bosnian.
    case bosnian = "bs"
    
    /// Catalan.
    case catalan = "ca"
    
    /// Czech.
    case czech = "cs"
    
    /// German.
    case german = "de"
    
    /// Greek.
    case greek = "el"
    
    /// English (which is the default).
    case english = "en"
    
    /// Spanish.
    case spanish = "es"
    
    /// Estonian.
    case estonian = "et"
    
    /// French.
    case french = "fr"
    
    /// Croatian.
    case croatian = "hr"
    
    /// Hungarian.
    case hungarian = "hu"
    
    /// Indonesian.
    case indonesian = "id"
    
    /// Italian.
    case italian = "it"
    
    /// Icelandic.
    case icelandic = "is"
    
    /// Cornish.
    case cornish = "kw"
    
    /// Norwegian Bokmål.
    case norwegianBokmål = "nb"
    
    /// Dutch.
    case dutch = "nl"
    
    /// Polish.
    case polish = "pl"
    
    /// Portuguese.
    case portuguese = "pt"
    
    /// Russian.
    case russian = "ru"
    
    /// Slovak.
    case slovak = "sk"
    
    /// Slovenian.
    case slovenian = "sl"
    
    /// Serbian.
    case serbian = "sr"
    
    /// Swedish.
    case swedish = "sv"
    
    /// Tetum.
    case tetum = "tet"
    
    /// Turkish.
    case turkish = "tr"
    
    /// Ukrainian.
    case ukrainian = "uk"
    
    /// Pig Latin.
    case pigLatin = "x-pig-latin"
    
    /// Simplified Chinese.
    case simplifiedChinese = "zh"
    
    /// Traditional Chinese.
    case traditionalChinese = "zh-tw"
}
