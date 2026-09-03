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
  "Test for `restlib-url-add-query-items'.")

(ert-deftest test-restlib-url-filename ()
  "Test for `restlib-url-filename'.")

(ert-deftest test-restlib-url-path ()
  "Test for `restlib-url-path'.")

(ert-deftest test-restlib-url-query ()
  "Test for `restlib-url-query'.")

(ert-deftest test-restlib-url-query-items ()
  "Test for `restlib-url-query-items'.")

(ert-deftest test-restlib-url-remove-query ()
  "Test for `restlib-url-remove-query'.")

(ert-deftest test-restlib-json-empty-string-to-nil ()
  "Test for `restlib-json-empty-string-to-nil'.")


(provide 'test-restlib)
;;; test-restlib.el ends here
