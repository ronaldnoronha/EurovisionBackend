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
    "country": "albania",
    "songName": "Duje",
    "link": "mp8OG4ApocI"
    },
    {
    "country": "armenia",
    "songName": "Future Lover",
    "link": "Co8ZJIejXBA"
    },
    {
    "country": "australia",
    "songName": "Promise",
    "link": "aqtu2GspT80"
    },
    {
    "country": "austria",
    "songName": "Who The Hell Is Edgar?",
    "link": "ZMmLeV47Au4"
    },
    {
    "country": "azerbaijan",
    "songName": "Tell Me More",
    "link": "5dvsr-L3HgY"
    },
    {
    "country": "belgium",
    "songName": "Because of You",
    "link": "ORhEoS6d8e4"
    },
    {
    "country": "croatia",
    "songName": "Mama SC",
    "link": "AyKj8jA0Qoc"
    },
    {
    "country": "cyprus",
    "songName": "Break a Broken Heart",
    "link": "zrFUKqTy4zI"
    },
    {
    "country": "czechia",
    "songName": "My Sister's Crown",
    "link": "-y78qgDlzAM"
    },
    {
    "country": "denmark",
    "songName": "Breaking My Heart",
    "link": "uWs69ddGEW4"
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
    "country": "france",
    "songName": "Evidemment",
    "link": "GWfbEFH9NvQ"
    },
    {
    "country": "georgia",
    "songName": "Echo",
    "link": "E8kO-QPippo"
    },
    {
    "country": "germany",
    "songName": "Blood & Glitter",
    "link": "Y12_YMs9kCQ"
    },
    {
    "country": "greece",
    "songName": "What They Say",
    "link": "qL0EkId_sTY"
    },
    {
    "country": "iceland",
    "songName": "Power",
    "link": "BhlJXcCv7gw"
    },
    {
    "country": "ireland",
    "songName": "We Are One",
    "link": "ak5Fevs424Y"
    },
    {
    "country": "israel",
    "songName": "Unicorn",
    "link": "r4wbdKmM3bQ"
    },
    {
    "country": "italy",
    "songName": "Due vite",
    "link": "N4HBDAbdXUg"
    },
    {
    "country": "latvia",
    "songName": "Aija",
    "link": "XRV2-jPqaUw"
    },
    {
    "country": "lithuania",
    "songName": "Stay",
    "link": "68lbEUDuWUQ"
    },
    {
    "country": "malta",
    "songName": "Dance (Our Own Party)",
    "link": "Apqwl0ayL6A"
    },
    {
    "country": "moldova",
    "songName": "Soarele si Luna",
    "link": "se9LDgFW6ak"
    },
    {
    "country": "netherlands",
    "songName": "Burning Daylight",
    "link": "UOf-oKDlO6A"
    },
    {
    "country": "norway",
    "songName": "Queen of Kings",
    "link": "CxNiUxdJnTQ"
    },
    {
    "country": "poland",
    "songName": "Solo",
    "link": "Jjsl-JCHDWE"
    },
    {
    "country": "portugal",
    "songName": "Ai Coracao",
    "link": "wa3suiOzAAk"
    },
    {
    "country": "romania",
    "songName": "D.G.T (Off and On)",
    "link": "NRxv-AUCinQ"
    },
    {
    "country": "san-marino",
    "songName": "Like An Animal",
    "link": "Hjfq-T-8WHw"
    },
    {
    "country": "serbia",
    "songName": "Samo mi se spava",
    "link": "oeIVwYUge8o"
    },
    {
    "country": "slovenia",
    "songName": "Carpe Diem",
    "link": "vfTiuZaESKs"
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
    "country": "switzerland",
    "songName": "Watergun",
    "link": "_8-Sbc_GZMc"
    },
    {
    "country": "ukraine",
    "songName": "Heart of Steel",
    "link": "neIscK1hNxs"
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
