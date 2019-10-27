# frozen_string_literal: true

require 'rainbow'
require_relative 'json_formatter'
require_relative 'list_formatter'
require_relative 'txt_formatter'
require_relative 'yaml_formatter'
require_relative 'resume_json_formatter'
require_relative 'resume_list_formatter'
require_relative 'resume_yaml_formatter'
require_relative 'resume_txt_formatter'
require_relative 'moodle_csv_formatter'
require_relative 'csv_formatter'
require_relative 'html_formatter'
require_relative 'xml_formatter'

# FormaterFactory module
module FormatterFactory
  def self.get(report, format, filename)
    case format
    when :colored_text
      f = TXTFormatter.new(report,true)
    when :csv
      f = CSVFormatter.new(report)
    when :html
      f = HTMLFormatter.new(report)
    when :json
      f = JSONFormatter.new(report)
    when :list
      f = ListFormatter.new(report)
    when :moodle_csv
      f = MoodleCSVFormatter.new(report)
    when :resume_txt
      f = ResumeTXTFormatter.new(report, false)
    when :resume_colored_text
      f = ResumeTXTFormatter.new(report, true)
    when :resume_json
      f = ResumeJSONFormatter.new(report)
    when :resume_list
      f = ResumeListFormatter.new(report)
    when :resume_yaml
      f = ResumeYAMLFormatter.new(report)
    when :txt
      f = TXTFormatter.new(report,false)
    when :xml
      f = XMLFormatter.new(report)
    when :yaml
      f = YAMLFormatter.new(report)
    else
      raise Rainbow("[ERROR] FormaterFactory #{format} unkown!").red.bright
    end
    f.init(filename)
    f
  end

  def self.ext(format)
    data = { cvs: 'csv',
             colored_text: 'txt',
             json: 'json',
             list: 'txt',
             resume_colored_text: 'txt',
             resume_csv: 'csv',
             resume_json: 'json',
             resume_list: 'txt',
             resume_txt: 'txt',
             resume_yaml: 'yaml',
             txt: 'txt',
             yaml: 'yaml' }
    return format.to_s if data[format].nil?

    data[format]
  end
end
