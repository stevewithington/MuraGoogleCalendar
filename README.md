# MuraGoogleCalendar

This is a [Mura](http://getmura.com) plugin that displays events from a public Google Calendar. This plugin leverages the [FullCalendar](http://fullcalendar.io) [jQuery](http://jquery.com) plugin. This allows for a much easier way for developers to visually customize the calendar as opposed to using Google's embed code.

## Important!
To use this plugin, you must first have a [Google Calendar API Key](https://console.developers.google.com/project).

  1. Go to the [Google Developer Console](https://console.developers.google.com/project) and click **Create Project**.
  2. In the "New Project" popup, enter any Project Name you wish, then click **Create** (it might take a few seconds).
  3. Once in the project, go to **APIs & auth > APIs** (in the left menu).
  4. Find "Calendar API" in the list and click the **OFF** button to turn it **ON**.
  5. On the sidebar menu, click **APIs & auth > Credentials**.
  6. In the "Public API access" section, click **Create new Key**.
  7. Choose **Browser key**.
  8. If you know what domains will host your calendar, enter them into the box. Otherwise, leave it blank. You can always change it later.
  9. Your new API KEY will appear. It might take a second or two before it starts working.
  10. Copy the API KEY for use when installing the plugin.

Once you have entered your domain(s) for use with your API Key, install the plugin, and enter your API Key in the required field.

After installing the plugin, visit the plugin's administration page for detailed instructions on how to use it.

### Make Your Google Calendar(s) Public
Any Google Calendar(s) you wish to use with this plugin, must be made public:

  1. In the Google Calendar interface, locate the "My Calendars" area on the left.
  2. Hover over the calendar you need and click the downward arrow.
  3. A menu will appear. Click "Share this Calendar".
  4. Check "Make this calendar public".
  5. Make sure "Share only my free/busy information" is **unchecked**.
  6. Click "Save".

### Obtain Your Google Calendar's ID

  1. In the Google Calendar interface, locate the "My calendars" area on the left.
  2. Hover over the calendar you need and click the downward arrow.
  3. A menu will appear. Click "Calendar settings".
  4. In the "Integrate Calendar" section of the screen, you will see your **Calendar ID**. It will look something like `abcd1234@group.calendar.google.com`.

### Note
The [Google Calendar API](https://console.developers.google.com/project) has an initial free quota of 1,000,000 requests/day. If you need more than that, you will have to [apply for a higher quota](https://support.google.com/code/contact/calendar_api_quota).

## Tested With
* Mura CMS Core Version 7.1+
* Adobe ColdFusion 2016+
* Lucee 5+

## License
Copyright 2013-2018 Stephen J. Withington, Jr.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.