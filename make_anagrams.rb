#!/usr/bin/env ruby
require 'anagrams'
require 'pp'

words = ARGF.read
pp Anagrams.new(words).make


