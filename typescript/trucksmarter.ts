// https://interviews.trucksmarter.com/kmeans.html
// https://interviews.trucksmarter.com/driver-locations.json
// https://interviews.trucksmarter.com/driver-locations-plot.png
// location history, find endpoints of lane 
// "lane" - a route that a driver drives multiple times 
// k-means algorithm 

// start with number of clusters, should be a param (2)
// select two points randomly 
// associate each data point using Euclidean distance: √((x2-x1)^2 + (y2-y1)^2) = 2.83\
// Recalculate the centroid of each cluster by taking the mean of all the data points in that cluster.

import * as fs from 'fs'

class KMeans {
  driverData: {current_locations: []}
  numberOfClusters: number
  clusterLocations: {}
  
  constructor(numberOfClusters: number){
    this.numberOfClusters = numberOfClusters
    this.driverData = this.fetchDriverData()
    this.clusterLocations = {}
  }

  fetchDriverData(){
    // return JSON.parse(fs.readFileSync('/home/coderpad/data/driver-locations.json','utf8'))
    console.log(JSON.parse(fs.readFileSync('/Users/laura/projects/fun_code/typescript/driver-locations.json','utf8')))
    return JSON.parse(fs.readFileSync('/Users/laura/projects/fun_code/typescript/driver-locations.json','utf8'))
  }

  initializeClusterLocations(){
    const highestIndex = this.driverData['current_locations'].length

    let counter = this.numberOfClusters
    
    while (counter > 0){
      const indexOfRandomLocation = Math.floor(Math.random() * highestIndex)
      const keyForClusterLocation = this.driverData['current_locations'][indexOfRandomLocation]
      // this.clusterLocations[keyForClusterLocation] = []
      counter--
    }
  }

  calculateEuclideanDistance(tempLocation: any, clusterLocation: any){
    // ((x2-x1)^2 + (y2-y1)^2) = 2.83
    const calculatedLat = Math.pow(2, tempLocation['lat'] - clusterLocation['lat'])
    const calculatedLong = Math.pow(2, tempLocation['long'] - clusterLocation['long'])
    return calculatedLat + calculatedLong
  }

  // Example data points
  // { lat: 34.0630545, lon: -118.2365899 },
  // { lat: 34.0630545, lon: -118.2365899 },
  calculateClusterLocations(){
    this.initializeClusterLocations()
    const clusters = Object.keys(this.clusterLocations)
    console.log(this.driverData)
    const locations = this.driverData['current_locations']
    
    const trackDistance = {}
      
    for (const location of locations) {
      const allCalculatedValues: number[][] = []
      
      // check against all clusters
      for (let i = 0; i < clusters.length; i++) {
        const calculatedValue = this.calculateEuclideanDistance(location, clusters[i])
        const clusterIndexAndDistance = [i, calculatedValue]
        allCalculatedValues.push(clusterIndexAndDistance)
      }

      // whichever cluster has the smallest difference
      // add the location to the cluster
      const closest = allCalculatedValues.sort((a,b) => a[1] - b[1]).pop()
      console.log(closest)
      this.addToCluster(closest)
    }
  }

  addToCluster(location: any){
    // const keyForCluster = this.clusterLocations[0]
    // if(this.clusterLocations){

    // } else {

    // }

  }


}

const clusterCount = 2
const kMeans = new KMeans(clusterCount)


// const _ = require('lodash');

// class Greeter {
//     greeting: string;
//     constructor(message: string) {
//         this.greeting = message;
//     }
//     greet() {
//         return "Hello, " + this.greeting;
//     }
// }

// let greeter = new Greeter("world");

// _.times(4, () => console.log(greeter.greet()));


// print('Hello world!')
