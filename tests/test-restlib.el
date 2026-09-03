;;; test-restlib.el --- Casual Suite Tests      -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Charles Y. Choi

;; Author: Charles Choi <kickingvegas@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'ert)
(require 'restlib-test-utils)
(require 'restlib)

(ert-deftest test-restlib-url-parse ()
  "Test for `restlib-url-parse'."
  (let* ((testURL "https://heythey.com/bingsu#wat")
         (url-obj (restlib-url-parse testURL)))

    (should (string-equal (url-type url-obj) "https"))
    (should (string-equal (url-host url-obj) "heythey.com"))
    (should (string-equal (url-filename url-obj) "/bingsu"))
    (should (string-equal (url-target url-obj) "wat"))))


(ert-deftest test-restlib-url-add-query-items ()
  "Test for `restlib-url-add-query-items'."

  (let* ((testURL "https://heythey.com/bingsu#wat")
         (url-obj (restlib-url-parse testURL))
         (items '(("a" "b")
                  ("c" "d")))
         (control "https://heythey.com/bingsu?a=b&c=d#wat"))

    (should (string-equal (restlib-url-add-query-items url-obj items)
                          control))))

(ert-deftest test-restlib-url-filename ()
  "Test for `restlib-url-filename'."
  (let ((testURL "https://heythey.com/bingsu?a=b#wat"))
    (should (string-equal (restlib-url-filename testURL) "/bingsu?a=b"))))

(ert-deftest test-restlib-url-path ()
  "Test for `restlib-url-path'."
  (let ((testURL "https://heythey.com/bingsu/gothere?a=b#wat"))
    (should (string-equal (restlib-url-path testURL) "/bingsu/gothere"))))

(ert-deftest test-restlib-url-query ()
  "Test for `restlib-url-query'."
  (let ((testURL "https://heythey.com/bingsu/gothere?a=b#wat"))
    (should (string-equal (restlib-url-query testURL) "a=b"))))

(ert-deftest test-restlib-url-query-items ()
  "Test for `restlib-url-query-items'."
  (let ((testURL "https://heythey.com/bingsu/gothere?a=b#wat"))
    (should (equal (restlib-url-query-items testURL) '(("a" "b"))))))

(ert-deftest test-restlib-url-remove-query ()
  "Test for `restlib-url-remove-query'."

  (let ((testURL "https://heythey.com/bingsu/gothere?a=b#wat")
        (control "https://heythey.com/bingsu/gothere#wat"))
    (should (string-equal (restlib-url-remove-query testURL) control))))

(ert-deftest test-restlib-json-empty-string-to-nil ()
  "Test for `restlib-json-empty-string-to-nil'."

  (let* ((json-example "{ \"foo\" : \"mary\", \"bar\" : \"\" }")
         (json-obj (json-parse-string json-example
                                 :object-type 'hash-table
                                 :null-object nil)))

    (should (string-equal (map-elt json-obj "bar") ""))
    (restlib-json-empty-string-to-nil json-obj "bar")
    (should (not (map-elt json-obj "bar")))))


(provide 'test-restlib)
;;; test-restlib.el ends here
