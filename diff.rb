class Diff
  def initialize(compared_objects)
    @compared_objects = compared_objects
  end

  def execute
    show_result(sdiff_object)
  end

  def show_result(sdiff_object)
    sdiff_object.each do |line|
      line_number = (line.old_position + 1).to_s
      if line.changed?
        puts line_number + ' ' + '* ' + line.old_element + '|' + line.new_element
      elsif line.adding?
        puts '  ' + '+ ' + line.new_element
      elsif line.deleting?
        puts line_number + ' ' + '- ' + line.old_element
      else
        puts line_number.to_s + ' ' + '  ' + line.old_element
      end
    end
  end

  private

  def sdiff_object
    @sdiff_object = Diff::LCS.sdiff @compared_objects[0], @compared_objects[1]
  end
end
