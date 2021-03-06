;;; elixir-mix-tests.el --- elixir-mix ert unit tests

;; Copyright © 2013 Samuel Tonini

;; Author: Samuel Tonini
;; Maintainer: Samuel Tonini
;; Description: Integration of Elixir's building and deployment tool: mix into Emacs.
;; Created: So Jun  9 10:01:02 2013 (+0200)
;; URL: https://github.com/tonini/elixir-mix

;; This file is NOT part of GNU Emacs.

;; The MIT License (MIT)
;;
;; Copyright (c) Samuel Tonini
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy of
;; this software and associated documentation files (the "Software"), to deal in
;; the Software without restriction, including without limitation the rights to
;; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
;; the Software, and to permit persons to whom the Software is furnished to do so,
;; subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
;; FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
;; COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
;; IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;;; Code:

(require 'ert)

(ert-deftest test-flatten-of-list ()
  (should (equal (elixir-mix-flatten '(1 2 (3 4) 5))
                 '(1 2 3 4 5)))
  (should (equal (elixir-mix-flatten '(1 2 ("wood" "fire" (3)) 4 5))
                 '(1 2 "wood" "fire" 3 4 5))))

(ert-deftest test-mix-runner-cmdlist-builder ()
  (should (equal (elixir-mix--build-runner-cmdlist "help")
                 '("help")))
  (should (equal (elixir-mix--build-runner-cmdlist '("run"))
                 '("run")))
  (should (equal (elixir-mix--build-runner-cmdlist "help do")
                 '("help" "do")))
  (should (equal (elixir-mix--build-runner-cmdlist '("help" ""))
                 '("help"))))

(provide 'elixir-mix-tests)

;;; elixir-mix-tests.el ends here
