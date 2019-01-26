
class CaseManager

  private

  def build_hall_of_fame
    celebrities = {}

    @cases.each do |c|
      grade = c.report.tail[:grade]
      if celebrities[grade]
        label = celebrities[grade] + '*'
      else
        label = '*'
      end
      celebrities[grade] = label unless c.skip
    end

    a = celebrities.sort_by { |key, _value| key }
    list = a.reverse
    list
  end
end
