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
    "belgium",
    "bulgaria",
    "croatia",
    "cyprus",
    "czech-republic",
    "denmark",
    "estonia",
    "finland",
    "france",
    "germany",
    "georgia",
    "greece",
    "iceland",
    "ireland",
    "israel",
    "italy",
    "latvia",
    "lithuania",
    "malta",
    "moldova",
    "montenegro",
    "netherlands",
    "north-macedonia",
    "norway",
    "poland",
    "portugal",
    "romania",
    "san-marino",
    "serbia",
    "slovenia",
    "spain",
    "sweden",
    "switzerland",
    "ukraine",
    "united-kingdom"
]


let songEntries = """
[
    {
    "country": "austria",
    "songName": "Who The Hell Is Edgar?",
    "link": "ZMmLeV47Au4"
    },
    {
    "country": "portugal",
    "songName": "Ai Coracao",
    "link": "wa3suiOzAAk"
    },
    {
    "country": "switzerland",
    "songName": "Watergun",
    "link": "_8-Sbc_GZMc"
    },
    {
    "country": "poland",
    "songName": "Solo",
    "link": "Jjsl-JCHDWE"
    },
    {
    "country": "serbia",
    "songName": "Samo mi se spava",
    "link": "oeIVwYUge8o"
    },
    {
    "country": "france",
    "songName": "Evidemment",
    "link": "GWfbEFH9NvQ"
    },
    {
    "country": "cyprus",
    "songName": "Break a Broken Heart",
    "link": "zrFUKqTy4zI"
    },
    {
    "country": "spain",
    "songName": "Eaea",
    "link": "NGnEoSypBhE"
    },
    {
    "country": "sweden",
    "songName": "Tattoo",
    "link": "b3vJfR81xO0"
    },
    {
    "country": "albania",
    "songName": "Duje",
    "link": "mp8OG4ApocI"
    },
    {
    "country": "italy",
    "songName": "Due vite",
    "link": "N4HBDAbdXUg"
    },
    {
    "country": "estonia",
    "songName": "Bridges",
    "link": "wO9g5t3VSuw"
    },
    {
    "country": "finland",
    "songName": "Cha Cha Cha",
    "link": "znWi3zN8Ucg"
    },
    {
    "country": "czechia",
    "songName": "My Sister's Crown",
    "link": "-y78qgDlzAM"
    },
    {
    "country": "australia",
    "songName": "Promise",
    "link": "aqtu2GspT80"
    },
    {
    "country": "belgium",
    "songName": "Because of You",
    "link": "ORhEoS6d8e4"
    },
    {
    "country": "armenia",
    "songName": "Future Lover",
    "link": "Co8ZJIejXBA"
    },
    {
    "country": "moldova",
    "songName": "Soarele si Luna",
    "link": "se9LDgFW6ak"
    },
    {
    "country": "ukraine",
    "songName": "Heart of Steel",
    "link": "neIscK1hNxs"
    },
    {
    "country": "norway",
    "songName": "Queen of Kings",
    "link": "CxNiUxdJnTQ"
    },
    {
    "country": "germany",
    "songName": "Blood & Glitter",
    "link": "Y12_YMs9kCQ"
    },
    {
    "country": "lithuania",
    "songName": "Stay",
    "link": "68lbEUDuWUQ"
    },
    {
    "country": "israel",
    "songName": "Unicorn",
    "link": "r4wbdKmM3bQ"
    },
    {
    "country": "slovenia",
    "songName": "Carpe Diem",
    "link": "vfTiuZaESKs"
    },
    {
    "country": "croatia",
    "songName": "Mama SC",
    "link": "AyKj8jA0Qoc"
    },
    {
    "country": "united-kingdom",
    "songName": "I Wrote A Song",
    "link": "tJ21grjN6wU"
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
