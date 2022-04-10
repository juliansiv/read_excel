# frozen_string_literal: true

require 'benchmark'
require 'creek'
require 'fastsheet'
require 'simple_xlsx_reader'

class ReadExcel
  def initialize
    @path = "#{File.dirname(__FILE__)}/file_10000.xlsx"
  end

  def simple_xlsx_reader
    workbook = SimpleXlsxReader.open(@path)
    worksheets = workbook.sheets

    worksheets.each do |worksheet|
      num_rows = 0
      worksheet.rows.each do |row|
        row_cells = row
        num_rows += 1
      end
    end
  end

  def fastsheet
    sheet = Fastsheet::Sheet.new(@path)
    sheet.each_row do |row|
      row_cells = row
    end
  end

  def creek
    workbook = Creek::Book.new(@path)
    worksheets = workbook.sheets

    worksheets.each do |worksheet|
      num_rows = 0
      worksheet.rows.each do |row|
        row_cells = row.values
        num_rows += 1
      end
    end
  end
end

reader = ReadExcel.new

Benchmark.bm do |benchmark|
  benchmark.report('Simple: ') { reader.simple_xlsx_reader }
  benchmark.report('Creek : ') { reader.creek }
  benchmark.report('Fastsh: ') { reader.fastsheet }
end
