/**
 * Title      : Google Calendar's Event Email Parser
 * Author     : David Boyd
 * Purpose    : This script automates the copying, parsing, and pasting of an
 *            : event's email list.
 * Date       : 2023-08-31
 * Limitations: Calendar invite is extracted from user's default GCalendar.
 *            : Event query depends on GSheet's sheets: 'My Job' & 'Job Data'
 */

/**
  * Main fns to run the script
  *
  * @return{void}
  */
function getDepoCalendarGuestEmails() {
    // Declare & init vars
    var targetSheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('My Job');
    var targetCell = 'B20'
    var deponentName = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('Job Data').getRange('E2').getValue();
    var rmEmail = 'test@example.com' //TODO: convert to array

    // Process calendar event and emails
    var calendarEvent = getDepoCalendarEvent(deponentName);
    if (!calendarEvent) { return; }
    var emailList = parseAndCleanGuestEmailString(calendarEvent, rmEmail);

    // Output emails to sheet
    writeToSheet(targetSheet, targetCell, emailList);
}

/**
  * Get deposition's calendar invite from active user
  *
  * @param {string} deponentName
  * @param {CalendarEvent object} - a Google Calendar's event
  */
function getDepoCalendarEvent(deponentName) {
    var today = new Date();
    var calendar = CalendarApp.getDefaultCalendar();
    var events = calendar.getEventsForDay(today);

    // Get calendar invite
    for (var i = 0; i < events.length; i++) {
        if (events[i].getTitle().includes(deponentName)) {
            return events[i];
        }
    }

    Logger.log('Matching event not found.');
    return null;
}

/**
  * Extract email addresses from evetn and removes explicit email addresses
  *
  * @param {object} calendarEvent - a Google Calendar event
  * @param {string} rmEmail - an unwanted email #TODO: convert to array
  * @returns {string} - a csv list of email addresses
  */
function parseAndCleanGuestEmailString(calendarEvent, rmEmail) {
    // Parse email list
    var guestList = calendarEvent.getGuestList();

    var cleaned Emails = guestList
        .map(function (guest) {
            return guest.getEmail();
        })
        .filter(function (email) {
            return email !== rmEmail;   //TODO: loop through array of emails
        })

    var cleanedEmailsString = cleanedEmails.join(',');
    return cleanedEmailsString;
}

/**
  * Output email list to target sheet and cell number
  *
  * @param{object} sheet - a Google Sheet's name
  * @param{string} cell - the target cell number to write to
  * @param{string} emails - a csv list of email addresses
  * @return{void}
  */
function writeToSheet(sheet, cell, emails) {
    sheet.getRange(cell).setValue(emails);
}
