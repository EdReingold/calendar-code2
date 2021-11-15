(or (load "calendar.fasl" :if-does-not-exist nil)
    (load "calendar.fas" :if-does-not-exist nil)
    (load "calendar.sbin" :if-does-not-exist nil)
    (load "calendar.o" :if-does-not-exist nil)
    (load "calendar.lsp" :if-does-not-exist nil)
    (load "calendar.l" :if-does-not-exist nil))

(in-package "CC4")
(use-package "CC4")


; References

; EJ = Encyclopedia Judaica
; JE = Jewish Encyclopedia
; Gr = Graetz
; Gi = Atlas of the Holocaust by Martin Gilbert
; R = Jewish Book of Days by Cecil Roth, Edward Goldston, Ltd., London, 1931
; P = Jerusalem by Peters
; B = Day by Day in Jewish History by Abraham Bloch


(defconstant dates
  (list

   ; Av 10, 586 BC Destruction of 1st Temple
   ; (II Kings 25:1-12 says 7th day of 5th month).
   (fixed-from-hebrew (hebrew-date 3174 5 10))

   ; Kislev 25, 168 BC "Abomination of desolation" on Temple
   ; altar by Antiochus IV JE 1, 635, P has Dec 7, 167 BC.
   ; B has Kislev 15, 167 BCE
   (fixed-from-hebrew (hebrew-date 3593 9 25))

   ; Sept 26, 70 (Julian) Titus captures Jerusalem, P 120.
   (fixed-from-julian (julian-date 70 9 26))

   ; Tishri 9, 135 CE Execution of Rabbi Akiva (Hadrianic
   ; persecutions) B 7.
   (fixed-from-hebrew (hebrew-date 3896 7 9))

   ; Jan 7, 470 (Julian) Huna Mari (Resh Galuta) executed, R 6.
   ; B (p. 85) says Dec 18, 468 = 18 Tevet
   (fixed-from-julian (julian-date 470 1 7))

   ; May 18, 576 (Julian) = Sivan 4 over 500 Jews forcibly batized in
   ; Clermont-Ferrand, France, B. 193
   (fixed-from-julian (julian-date 576 5 18))

   ; Nov 7, 694 (Julian) Council of Egica, Spain, EJ 15, 221.
   (fixed-from-julian (julian-date 694 11 7))

   ; Apr 19, 1013 (Julian) Massacre of Jews in Cordova by Al Haqim, R 95
   (fixed-from-julian (julian-date 1013 4 19))

   ; May 18, 1096 (Julian) Crusader massacres at Worms, EJ 5, 1137.
   (fixed-from-julian (julian-date 1096 5 18))

   ; Mar 16, 1190 (Julian) Massacre at York, R 65.
   (fixed-from-julian (julian-date 1190 3 16))

   ; March 3, 1240 (Julian) (1st Saturday of Lent) Burning
   ; of the Talmud in France by Pope Gregory IX, EJ 8, 769, R 55
   (fixed-from-julian (julian-date 1240 3 3))

   ; Mar 26, 1288 (Julian) Jews burned at Troyes, EJ 15, 1407.
   (fixed-from-julian (julian-date 1288 3 26))

   ; April 20, 1298 (Julian) (Iyar 7) Massacre of Jews by
   ; Rindfleisch in Rottingen, Gr 4, 35
   (fixed-from-julian (julian-date 1298 4 20))

   ; June 4, 1391 (Julian) Riots in Seville, EJ 15, 235.
   (fixed-from-julian (julian-date 1391 6 4))

   ;Jan 25, 1436 (Julian) Massacre at Aix-en-Provence, R 21.
   (fixed-from-julian (julian-date 1436 1 25))

   ; Mar 31, 1492 (Julian) Edict of Expulsion (Spain), EJ 15, 241, R 77.
   (fixed-from-julian (julian-date 1492 3 31))

   ; Sept 9, 1553 (Julian) (Rosh Hashanah) Burning of the
   ; Talmud in Rome, EJ 8, 770, Gr 4, 565, R 215.
   (fixed-from-julian (julian-date 1553 9 9))

   ; Feb 24, 1560 (Julian) Auto-de-fe in Toledo, EJ 8, 1405
   (fixed-from-julian (julian-date 1560 2 24))

   ; June 10, 1648 (Sivan 20) Chmielnicki massacres in Nemirov, Gr 5, 8.
   (fixed-from-gregorian (gregorian-date 1648 6 10))

   ; June 30, 1680 (Gregorian) Auto-de-fe in Madrid, EJ 8, 1405, R 157.
   (fixed-from-gregorian (gregorian-date 1680 6 30))

   ; July 24, 1716 (Gregorian) (Erev Tisha b'Av), Riots
   ; (desecration of Torahs, massacre) in Posen, R 174.
   (fixed-from-gregorian (gregorian-date 1716 7 24))

   ; June 19, 1768 (Gregorian) Haidamack Massacres, EJ 7, 1133.
   (fixed-from-gregorian (gregorian-date 1768 6 19))

   ; August 2, 1819 (Gregorian) Hep! Hep! riots (Wuerzburg), EJ 8, 331.
   (fixed-from-gregorian (gregorian-date 1819 8 2))

   ; Nisan 12, 5599 AM (approx 1839) Forced conversions in
   ; Meshed, Persia, EJ 11, 1399
   (fixed-from-hebrew (hebrew-date 5599 1 12))

   ; Apr 19, 1903 (Gregorian) (Easter, last day of Pesach)
   ; Pogrom in Kishnev R 95
   (fixed-from-gregorian (gregorian-date 1903 4 19))

   ; Aug 25, 1929 (Gregorian) Hebron riots; 50 Jews killed
   (fixed-from-gregorian (gregorian-date 1929 8 25))

   ; Sep 29, 1941 Babi Yar, EJ 4, 27.
   (fixed-from-gregorian (gregorian-date 1941 9 29))

   ; April 19, 1943 (Gregorian) Warsaw Ghetto attack by
   ; Germans, EJ 16, 351.
   (fixed-from-gregorian (gregorian-date 1943 4 19))

   ; Oct 7, 1943 (Gregorian) 1260 children killed by the
   ; Nazis at Bialystock, Gi 165.
   (fixed-from-gregorian (gregorian-date 1943 10 7))

   ; Mar 17, 1992 (Gregorian) Car bombing of Israeli Embassy
   ; in Buenos Aires, Argentina--29 people killed
   (fixed-from-gregorian (gregorian-date 1992 3 17))

   ; Feb 25, 1996 (Gregorian) Suicide bombing in Israel
   (fixed-from-gregorian (gregorian-date 1996 2 25))

   ; Nov 9-10, 2038 (Gregorian) 100th anniversary of Kristallnacht
   ; 91 Jews killed, hundreds seriously injured, and thousands
   ; more humiliated and terrorized. About 7,500 Jewish
   ; businesses were gutted and an estimated 177 synagogues were
   ; burned or otherwise demolished
   (fixed-from-gregorian (gregorian-date 2038 11 10))

   ; Jul 18, 2094 (Gregorian) 100th anniversary of bombing
   ; of the Jewish Community Center in Buenos Aires,
   ; Argentina--86 people killed
   (fixed-from-gregorian (gregorian-date 2094 7 18))

   ))

(defun cat (&rest args) (apply 'concatenate 'string args))

;; Redefine this from calendar.l to get rid of the double
;; precision for printing
;; (defun jd-from-fixed (d)
;;   (single-float (jd-from-moment d)))
(defun jd-from-fixed (d)
  (coerce (jd-from-moment d) 'single-float))

(defun unix-from-fixed (d)
  (unix-from-moment d))

(defun fixed-from-unix (s)
  ;; TYPE second -> moment
  ;; Fixed date from Unix second count $s$
  (+ unix-epoch (floor (/ s 24 60 60))))

(defun chinese-day-name-from-fixed (d)
  (chinese-day-name d))

(defun solar-long-from-fixed (d)
  (solar-longitude (+ d 0.5L0)))

(defun ephem-corr-from-fixed (d)
  (ephemeris-correction d))

(defun lunar-long-from-fixed (d)
  (lunar-longitude d))

(defun lunar-lat-from-fixed (d)
  (lunar-latitude d))

(defun lunar-alt-from-fixed (d)
  (lunar-altitude d mecca))

(defun moonrise-from-fixed (d)
  (format-time (moonrise d mecca)))

(defun moonset-from-fixed (d)
  (format-time (moonset d mecca)))

(defun new-moon-after-from-fixed (d)
  (new-moon-at-or-after d))

(defun solstice-from-fixed (d)
  (solar-longitude-after 
   (* 90 (ceiling (solar-longitude d) 90))
   d))

(defun orthodox-easter-from-fixed (d)
  (gregorian-from-fixed 
   (orthodox-easter (standard-year (gregorian-from-fixed d)))))

(defun easter-from-fixed (d)
  (gregorian-from-fixed 
   (easter (standard-year (gregorian-from-fixed d)))))

(defun astronomical-easter-from-fixed (d)
  (gregorian-from-fixed 
   (astronomical-easter (standard-year (gregorian-from-fixed d)))))

(defun day-from-fixed (d)
  (nth (day-of-week-from-fixed d)
       '("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday"
         "Friday" "Saturday")))

(defun olympiad-from-fixed (d)
  (olympiad-from-julian-year
   (standard-year (julian-from-fixed d))))

(defun dawn-from-fixed (day)
  ;; At Paris
  (format-time (dawn day paris 18d0)))

(defun mid-day-from-fixed (day)
  ;; At Tehran
  (format-time (standard-from-universal (midday-in-tehran day) tehran)))

(defun set-from-fixed (day)
  ;; At Jerusalem
  (format-time (sunset day jerusalem)))

(defun format-time (p)
  (if (equal p bogus)
      "\\multicolumn{4}{c}{\\fun{bogus}}"
          ;;;  add 1/2 second...
    (let ((time (clock-from-moment (+ (/ 0.5 24 60 60) p))))
      (list (mod p 1)
            (format nil "~2,'0D" (first time))
            (format nil "~2,'0D" (second time))
            ;;; ....and truncate
            (format nil "~2,'0D" (floor (third time)))))))

(defun major-solar-term-on-or-after-from-fixed (d)
  (major-solar-term-on-or-after d))

(defun ephem-from-fixed (d)
  (ephemeris-correction d))

(defun eqn-of-time-from-fixed (d)
  (equation-of-time d))

(defun convert (date calendar)
  (let ((d; converted date
         (apply
          (read-from-string
           (cat (string calendar) "-from-fixed"))
          (list date))))
    (if (and (not (member calendar do-not-invert-list))
;;    (if (and (not (excl::memq calendar do-not-invert-list))
             (/= date
                 (apply
                  (read-from-string
                   (cat "fixed-from-" (string calendar)))
                  (list d))))
        (print (format nil "Conversion failed: ~D, ~D" calendar date)))
;      (print  (format nil "Conversion succeeded: ~D, ~D" calendar date)))
    (if (not (listp d))
        (list d)
      d)))

(defun texify (x)
  (cond ((stringp x)                         (cat " & " x))
        ((> (length (format nil "~D" x)) 12) (format nil " & $~12,6F$" x))
        ((numberp x)                         (format nil " & $~D$" x))
        (x                                   " & $t$")
        (t                                   " & $f$")))

(defun compute-dates (calendars filename dlist)
  (let* ((file (progn (if (probe-file  filename)
                          (delete-file filename))
                      (open filename :direction :output))))
  (format file
          (apply 'cat
                 (mapcar
                  #'(lambda (d)
                      (cat
                       (format nil "$~D$" d)
                       (apply 'cat
                              (mapcar
                               'texify
                               (apply 'append
                                      (map 'list
                                           #'(lambda (x) (convert d x))
                                           calendars))))
;                       (format nil "\\\\ \\hline~%")))
                       (format nil "\\\\~%")))
                  dlist)))
  (close file)))

(defconstant calendars-1
  '(day jd mjd unix gregorian julian roman olympiad egyptian armenian))

(defconstant calendars-2
  '(akan-name coptic ethiopic iso icelandic islamic observational-islamic
              saudi-islamic hebrew observational-hebrew))

(defconstant calendars-3
  '(persian arithmetic-persian bahai astro-bahai 
    french arithmetic-french orthodox-easter easter astronomical-easter))

(defconstant calendars-4
  '(mayan-long-count mayan-haab mayan-tzolkin aztec-xihuitl aztec-tonalpohualli
    bali-pawukon babylonian samaritan))

(defconstant calendars-5
  '(chinese chinese-day-name major-solar-term-on-or-after
    old-hindu-solar hindu-solar astro-hindu-solar old-hindu-lunar hindu-lunar
    astro-hindu-lunar tibetan))

(defconstant calendars-6
  '(ephem-corr eqn-of-time solar-long solstice dawn mid-day set))

(defconstant calendars-7
  '(lunar-long lunar-lat lunar-alt new-moon-after moonrise moonset))

(defconstant do-not-invert-list
  '(mayan-haab mayan-tzolkin aztec-xihuitl aztec-tonalpohualli
    orthodox-easter easter astronomical-easter
    bali-pawukon major-solar-term-on-or-after chinese-day-name 
    solar-long solstice ephem-corr eqn-of-time mid-day dawn set
    lunar-long lunar-lat lunar-alt day new-moon-after
    akan-name moonrise moonset olympiad))

(compute-dates
 (append calendars-1 calendars-2) ;  calendars-3 calendars-4 calendars-5 calendars-6 calendars-7)  ;; stupid limit
 "nov12a.tex"
 (list (fixed-from-gregorian '(1945 11 12))))

(compute-dates
 (append calendars-3 calendars-4)
 "nov12b.tex"
 (list (fixed-from-gregorian '(1945 11 12))))

(compute-dates
 (append calendars-5 calendars-6)  ;; stupid limit
 "nov12c.tex"
 (list (fixed-from-gregorian '(1945 11 12))))

(compute-dates
 (append calendars-7)  ;; stupid limit
 "nov12d.tex"
 (list (fixed-from-gregorian '(1945 11 12))))

(compute-dates calendars-1 "dates1.tex" dates)
(compute-dates calendars-2 "dates2.tex" dates)
(compute-dates calendars-3 "dates3.tex" dates)
(compute-dates calendars-4 "dates4.tex" dates)
(compute-dates calendars-5 "dates5.tex" dates)
(compute-dates calendars-6 "dates6.tex" dates)
(compute-dates calendars-7 "dates7.tex" dates)


