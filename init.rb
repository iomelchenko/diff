require './compared_object'
require './diff'
require 'diff/lcs'

files_pathes = ARGV

if (arg_count = files_pathes.count) != 2
  puts "Please Please supply two arguments (file pathes) in the command line. Passed #{arg_count}."
  return
end

compared_objects = files_pathes.map do |file|
  ComparedObject.new(file).lines_array
end

Diff.new(compared_objects).execute
