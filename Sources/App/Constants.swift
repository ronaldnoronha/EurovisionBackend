//
//  File.swift
//  
//
//  Created by Noronha, Ronald on 16/4/2023.
//

import Foundation

struct Song: Codable {
    let country: String
    let songName: String
    let link: String
}

var stopVoting: Bool = false

let participants: [String] = [
    "albania",
    "armenia",
    "australia",
    "austria",
    "azerbaijan",
    "belarus",
    "belgium",
    "bosnia-and-herzegovina",
    "bulgaria",
    "croatia",
    "cyprus",
    "czechia",
    "denmark",
    "estonia",
    "finland",
    "france",
    "georgia",
    "germany",
    "greece",
    "hungary",
    "iceland",
    "ireland",
    "israel",
    "italy",
    "latvia",
    "lithuania",
    "luxembourg",
    "malta",
    "moldova",
    "montenegro",
    "morocco",
    "netherlands",
    "north-macedonia",
    "norway",
    "poland",
    "portugal",
    "romania",
    "russia",
    "san-marino",
    "serbia",
    "sloakia",
    "slovenia",
    "spain",
    "sweden",
    "switzerland",
    "turkey",
    "ukraine",
    "united-kingdom"
]

let songEntries = """
[
    {
        "country": "sweden",
        "songName": "Unforgettable",
        "link": "K4hlFKVHsag"
    },
    {
        "country": "ukraine",
        "songName": "Teresa & Maria",
        "link": "-qjs54ZTRBQ"
    },
    {
        "country": "germany",
        "songName": "Always on the Run",
        "link": "_KXwJAu7aCU"
    },
    {
        "country": "luxembourg",
        "songName": "Fighter",
        "link": "u6p4dujtvPI"
    },
    {
        "country": "netherlands",
        "songName": "Europapa",
        "link": "IiHFnmI8pxg"
    },
    {
        "country": "israel",
        "songName": "Hurricane",
        "link": "xGvv0kIZgZI"
    },
    {
        "country": "lithuania",
        "songName": "Luktelk",
        "link": "HuLKyOQcRDw"
    },
    {
        "country": "spain",
        "songName": "Zorra",
        "link": "RUa9TMRzmlI"
    },
    {
        "country": "estonia",
        "songName": "(nendest) narkootikumidest ei tea me (küll) midagi",
        "link": "7uSGQ566fyY"
    },
    {
        "country": "ireland",
        "songName": "Doomsday Blue",
        "link": "BNc5zTYkTaQ"
    },
    {
        "country": "latvia",
        "songName": "Hollow",
        "link": "N1YvDgwszn8"
    },
    {
        "country": "greece",
        "songName": "Zari",
        "link": "VRBBQ-B4q4s"
    },
    {
        "country": "united-kingdom",
        "songName": "Dizzy",
        "link": "kiIhvA2Ozzk"
    },
    {
        "country": "norway",
        "songName": "Ulveham",
        "link": "UycoKAz1Jm8"
    },
    {
        "country": "italy",
        "songName": "La noia",
        "link": "jwfjNjV5DIw"
    },
    {
        "country": "serbia",
        "songName": "Ramonda",
        "link": "IyO42taxFpM"
    },
    {
        "country": "finland",
        "songName": "No Rules!",
        "link": "eXvdKgO2Acw"
    },
    {
        "country": "portugal",
        "songName": "Grito",
        "link": "246RdLYgRZY"
    },
    {
        "country": "armenia",
        "songName": "Jako",
        "link": "t0sefiNLP_E"
    },
    {
        "country": "cyprus",
        "songName": "Liar",
        "link": "_6ncN7WC_Og"
    },
    {
        "country": "switzerland",
        "songName": "The Code",
        "link": "coOJkjCMcow"
    },
    {
        "country": "slovenia",
        "songName": "Veronika",
        "link": "tSek8SqlDIA"
    },
    {
        "country": "croatia",
        "songName": "Rim Tim Tagi Dim",
        "link": "6LyjyuaQggs"
    },
    {
        "country": "georgia",
        "songName": "Firefighter",
        "link": "9zrWufVsIeM"
    },
    {
        "country": "france",
        "songName": "Mon amour",
        "link": "f-z9PFfpzeE"
    },
    {
        "country": "austria",
        "songName": "We Will Rave",
        "link": "KqSuRaN9zFk"
    }
]
"""

func getSongEntries(country: String) -> [Song] {
    let data = Data(songEntries.utf8)

    do {
        let decoder = JSONDecoder()
        var songs = try decoder.decode([Song].self, from: data)
        songs = songs.filter { $0.country != country }
        return songs
    } catch {
        fatalError("Couldn't decode object from JSON: \(error)")
    }
}
