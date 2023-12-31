// Get the current date
var currentDate = new Date()
// Get yesterday's date
var yesterday = new Date();
yesterday.setDate(currentDate.getDate() - 1);

// Get the start of the month
var startOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() +1, 1);

// Get the date two weeks ago
var twoWeeksAgo = new Date();
twoWeeksAgo.setDate(currentDate.getDate() + 14);

// Format the date in the 'YYYY-MM-DD 00:00:00' format
function formatDate(date) {
  var d = new Date(date),
      month = '' + (d.getMonth() + 1),
      day = '' + d.getDate(),
      year = d.getFullYear();

  if (month.length < 2) 
      month = '0' + month;
  if (day.length < 2) 
      day = '0' + day;

  return [year, month, day].join('-') + ' 00:00:00';
}

// Return an array of filter conditions
return [
  { title: 'Expired', value: {id: 'expired', end_date: formatDate(currentDate)} },
  { title: 'Not Expired', value: {id: 'not_expired', end_date: formatDate(yesterday) }},
  { title: 'Expired To This Month', value: {id:  'expired_to_this_month', end_date: formatDate(startOfMonth) }},
  { title: 'Expired To next 2 Weeks', value: {id: 'expired_to_next_2_weeks', end_date: formatDate(twoWeeksAgo) }},
];
