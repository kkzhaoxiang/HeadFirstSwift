//
//  HomeTheaterFacade.swift
//  headFirst
//
//  Created by 疯狂的石头 on 2019/4/10.
//  Copyright © 2019 疯狂的石头. All rights reserved.
//

import Foundation

class HomeTheaterFacade {
    
    var dvd: DvdPlayer
    var cd: CdPlayer
    var lights: TheaterLights
    
    init(with dvd: DvdPlayer, cd: CdPlayer, lights: TheaterLights) {
        self.dvd = dvd
        self.cd = cd
        self.lights = lights
    }
    
    func watchMovie(movie: String) {
        lights.dim(num: 10)
        dvd.play(movie: movie)
        cd.play(movie: movie)
        dvd.on()
    }
    
    func endMovie() {
        dvd.stop()
        dvd.eject()
        dvd.off()
    }
}
