

/*
Parafin coding challenge.
 
Businesses pay back advances using a percentage of their sales. 
Some businesses pay back based on their daily sales, while others pay back on a weekly basis. 

Businesses can switch their payment cadence once a day 
changes take effect from next day onwards. 

You will be provided with sales data for each day during the period.

Given a set of businesses, their payment cadence history and their daily sales, 
compute the repayments that we expect from the businesses.
*/


/*

Given a set of businesses, their payment cadence history and their daily sales, 
compute the repayments that we expect from the businesses.

// start with calculate daily
// check the payment cadence, 
//      if weekly - sum for 7 days, 
//      if daily, sum for 1 day
// calculate weekly
// if number of payment days is not divisisble by 7, then sum the remaining into a group
// 
// customer reached out on the 2nd and asked to switch to weekly 
*/
const business_sales = {
  "name": "Da Sichuan",
  "repayment_rate": 10.0,  // 10% of sales
  "payment_cadence": {
    2: "weekly"  // key is the date the change was requested, the value is the preferred payment cadence
  },
  "sales": {
    1: 500.0,  // total daily sales
    2: 300.0,  // daily
    3: 400.0,  // start weekly
    4: 550.0,
    5: 200.0,
    6: 350.0,
    7: 350.0,
    8: 350.0,
    9: 350.0,
    10: 350.0,
    11: 450.0
  }
}

const business_payments = {
  "name": "Da Sichuan",
  "repayments": {
    1: 50.0,
    2: 30.0,
    9: 255.0,
    11: 80.0 // no sales left behind
  }
}

function calculatePayments(business_sales) {
  const sales = business_sales['sales']
  const payments = { name: business_sales['name'], repayments: {} }
  const dayRequestedChange = business_sales['payment_cadence'] ? parseInt(Object.keys(business_sales['payment_cadence'])[0]) : undefined
  const dayForChange = dayRequestedChange ? dayRequestedChange + 1 : undefined
  let candence = 'daily'

  for (var i = 1; i < Object.keys(sales).length;) {
    if (dayRequestedChange && (i == dayForChange)) {
      candence = business_sales['payment_cadence'][dayRequestedChange]
    }

    if (candence === 'weekly') {
      const weeklyTotal = calculateWeekly(i, sales)
      i += 7
      payments['repayments'][i] = weeklyTotal * 0.1
    } else if (candence === 'daily') {
      payments['repayments'][i] = sales[i] * 0.1
      i += 1
    }
  }
  return payments
}

function calculateWeekly(currentIndex, sales) {
  let weeklyTotal = 0
  for (var i = 0; i < 7 && sales[currentIndex]; i++) {
    weeklyTotal += parseInt(sales[currentIndex])
    currentIndex += 1
  }
  return weeklyTotal
}


let res = calculatePayments(business_sales);

console.log('output:', res)
