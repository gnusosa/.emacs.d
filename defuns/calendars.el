(require 'calfw-ical)

(defun work-calendar nil
  (interactive)
  (cfw:open-ical-calendar "http://www.domain.tld/calendar/ical/user/basic.ics")
)
(defun team-calendar nil
  (interactive)
  (cfw:open-ical-calendar "http://www.domain.tld/calendar/ical/user/basic.ics")
)

(defun holiday-calendar nil
  (interactive)
  (cfw:open-ical-calendar "http://www.domain.tld/calendar/ical/user/basic.ics")
)
