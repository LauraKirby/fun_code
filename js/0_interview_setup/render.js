// prompt https://slab.render.com/public/posts/ref0taeb
void async function main() {
  const fileNames = [
    'logs/api-75fd6d7c7d-7qsr5.log', 
    'logs/api-75fd6d7c7d-brhdl.log', 
    'logs/api-75fd6d7c7d-nptc9.log'
  ]

  const summary = {errorCount: 0, infoCount: 0, totalLogLines: 0, highestHour: 0, highestMinute: 0}

  const fs = require('fs'),
      path = require('path')

  const parseLogs = async (filePaths) => {
    let groupByHour = {}
    let groupByMinute = {}
  
    for(let i = 0; i < filePaths.length; i++){
      filePath = path.join(__dirname, fileNames[i]);
      
      const fileData = fs.readFileSync(filePath, {encoding: 'utf-8'});
      const dataByNewLines = fileData.split('\n')
      summary.totalLogLines += dataByNewLines.length

      for(let k = 0; k < dataByNewLines.length; k++){
        const line = dataByNewLines[k]
  
        sortByLogLevel(line)

        // parse hour
        const hourKey = line[17] + line[18]
        mostLogsPerHour(hourKey, groupByHour)

        // highest logs per minute
        const hourMinuteKey = line[17] + line[18] + line[19] + line[20] + line[21]
         mostLogsPerMinute(hourMinuteKey, groupByMinute)

      }
    }
  }

  const sortByLogLevel = (line) => {
    if(line.includes("level=error")){
      summary.errorCount++
    } else if (line.includes("level=info")) {
      summary.infoCount++
    }
  }

  const mostLogsPerHour = (hourKey, groupByHour) => {
    if(typeof hourKey === 'string'){
      summary.highestHour = hourKey
      if(!groupByHour[hourKey]){
        groupByHour[hourKey] = 1
      } else {
        groupByHour[hourKey]++
      }

      if(groupByHour[summary.highestHour] < groupByHour[hourKey]) {
        summary.highestHour = hourKey
      }
    } else {
      console.log('invalid hourKey')
    }
  }

  const mostLogsPerMinute = (hourKey, groupByHour) => {
    if(typeof hourKey === 'string'){
      summary.highestMinute = hourKey
      if(!groupByHour[hourKey]){
        groupByHour[hourKey] = 1
      } else {
        groupByHour[hourKey]++
      }

      if(groupByHour[summary.highestMinute] < groupByHour[hourKey]) {
        summary.highestHour = hourKey
      }
    } else {
      console.log('invalid hourKey')
    }
  }

  await parseLogs(fileNames)

  console.log(summary)
  console.log("errorCount expected: ", "11")
  console.log("infoCount expected: ", "28,102")
  console.log("total expected total logs lines: ", "~28,135")
}()




